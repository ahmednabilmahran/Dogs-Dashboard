import 'dart:async';

import 'package:dogs_dashboard/core/utils/filterable_list.dart';
import 'package:dogs_dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

/// A customizable Autocomplete text field widget.
class EasyAutocomplete extends StatefulWidget {
  /// Creates a new instance of [EasyAutocomplete].
  ///
  /// Throws an [AssertionError] if both [onChanged] and [controller]
  /// are `null`, or both [initialValue] and [controller] are set,
  /// or both [suggestions] and [asyncSuggestions] are set or null.
  const EasyAutocomplete({
    super.key,
    this.suggestions,
    this.readOnly,
    this.asyncSuggestions,
    this.suggestionBuilder,
    this.progressIndicatorBuilder,
    this.controller,
    this.decoration,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.inputFormatter = const [],
    this.initialValue,
    this.hintText,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.cursorColor,
    this.inputTextStyle = const TextStyle(),
    this.suggestionTextStyle = const TextStyle(),
    this.suggestionBackgroundColor,
    this.debounceDuration = const Duration(milliseconds: 400),
    this.validator,
  })  : assert(
          onChanged != null || controller != null,
          // ignore: lines_longer_than_80_chars
          'onChanged and controller parameters cannot be both null at the same time',
        ),
        assert(
          controller == null || initialValue == null,
          'controller and initialValue cannot be used at the same time',
        ),
        assert(
          (suggestions != null && asyncSuggestions == null) ||
              (suggestions == null && asyncSuggestions != null),
          // ignore: lines_longer_than_80_chars
          'suggestions and asyncSuggestions cannot be both null or have values at the same time',
        );

  /// The list of suggestions to be displayed
  final List<String>? suggestions;

  /// Fetches list of suggestions from a Future
  final Future<List<String>> Function(String searchValue)? asyncSuggestions;

  /// Text editing controller
  final TextEditingController? controller;

  /// Can be used to decorate the input
  final InputDecoration? decoration;

  /// Function that handles the changes to the input
  final void Function(String)? onChanged;

  /// Function that handles the submission of the input
  final void Function(String)? onSubmitted;

  /// Function that handles the tap on the field
  final VoidCallback? onTap;

  /// Can be used to set custom inputFormatters to field
  final List<TextInputFormatter> inputFormatter;

  /// Can be used to set the textfield initial value
  final String? initialValue;

  /// Can be used to set the textfield hint text
  final String? hintText;

  /// Can be used to set the text capitalization type
  final TextCapitalization textCapitalization;

  /// Determines if should gain focus on screen open
  final bool autofocus;

  /// Can be used to set different keyboardTypes to your field
  final TextInputType keyboardType;

  /// Can be used to manage TextField focus
  final FocusNode? focusNode;

  /// Can be used to set a custom color to the input cursor
  final Color? cursorColor;

  /// Can be used to set custom style to the suggestions textfield
  final TextStyle inputTextStyle;

  /// Can be used to set custom style to the suggestions list text
  final TextStyle suggestionTextStyle;

  /// Can be used to set custom background color to suggestions list
  final Color? suggestionBackgroundColor;

  /// Used to set the debounce time for async data fetch
  final Duration debounceDuration;

  /// Can be used to customize suggestion items
  final Widget Function(String data)? suggestionBuilder;

  /// Can be used to display custom progress idnicator
  final Widget? progressIndicatorBuilder;

  /// Can be used to validate field value
  final String? Function(String?)? validator;

  /// Can be used to make it readOnly
  final bool? readOnly;

  @override
  State<EasyAutocomplete> createState() => _EasyAutocompleteState();
}

/// Provides the state for an [EasyAutocomplete] widget.
class _EasyAutocompleteState extends State<EasyAutocomplete> {
  /// A [LayerLink] object that connects the overlay with the text field.
  final LayerLink _layerLink = LayerLink();

  /// The [TextEditingController] that controls the text field.
  late TextEditingController _controller;

  /// Indicates if the suggestions overlay has been opened at least once.
  bool _hasOpenedOverlay = false;

  /// Indicates whether the suggestions
  /// are currently being loaded asynchronously.
  bool _isLoading = false;

  /// The current overlay entry for the suggestions.
  OverlayEntry? _overlayEntry;

  /// A list of suggestions to display.
  List<String> _suggestions = [];

  /// A timer for debouncing.
  Timer? _debounce;

  /// The last search text value passed to the async suggestions function.
  String _previousAsyncSearchText = '';

  /// A [FocusNode] for controlling the focus of the text field.
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ??
        TextEditingController(text: widget.initialValue ?? '');
    _controller.addListener(() => updateSuggestions(_controller.text));
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        openOverlay();
      } else {
        closeOverlay();
      }
    });
  }

  void openOverlay() {
    if (_overlayEntry == null) {
      final renderBox = context.findRenderObject()! as RenderBox;
      final size = renderBox.size;
      final offset = renderBox.localToGlobal(Offset.zero);

      _overlayEntry ??= OverlayEntry(
        builder: (context) => Positioned(
          left: offset.dx,
          top: offset.dy + size.height + 5.0,
          width: size.width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0.0, size.height + 5.0),
            child: FilterableList(
              maxListHeight: 20.h,
              loading: _isLoading,
              suggestionBuilder: widget.suggestionBuilder,
              progressIndicatorBuilder: widget.progressIndicatorBuilder,
              items: _suggestions,
              suggestionTextStyle: widget.suggestionTextStyle,
              suggestionBackgroundColor: widget.suggestionBackgroundColor,
              onItemTapped: (value) {
                _controller.value = TextEditingValue(
                  text: value,
                  selection: TextSelection.collapsed(
                    offset: value.length,
                  ),
                );
                widget.onChanged?.call(value);
                widget.onSubmitted?.call(value);
                closeOverlay();
                _focusNode.unfocus();
              },
            ),
          ),
        ),
      );
    }
    if (!_hasOpenedOverlay) {
      Overlay.of(context).insert(_overlayEntry!);
      setState(() => _hasOpenedOverlay = true);
    }
  }

  void closeOverlay() {
    if (_hasOpenedOverlay) {
      _overlayEntry!.remove();
      setState(() {
        _previousAsyncSearchText = '';
        _hasOpenedOverlay = false;
      });
    }
  }

  Future<void> updateSuggestions(String input) async {
    rebuildOverlay();
    if (widget.suggestions != null) {
      widget.readOnly == false
          ? _suggestions = widget.suggestions!.where((element) {
              return element.toLowerCase().contains(input.toLowerCase());
            }).toList()
          : _suggestions = widget.suggestions!;
      rebuildOverlay();
    } else if (widget.asyncSuggestions != null) {
      setState(() => _isLoading = true);
      if (_debounce != null && _debounce!.isActive) _debounce!.cancel();
      _debounce = Timer(widget.debounceDuration, () async {
        if (_previousAsyncSearchText != input ||
            _previousAsyncSearchText.isEmpty ||
            input.isEmpty) {
          _suggestions = await widget.asyncSuggestions!(input);
          setState(() {
            _isLoading = false;
            _previousAsyncSearchText = input;
          });
          rebuildOverlay();
        }
      });
    }
  }

  void rebuildOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.markNeedsBuild();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onTap: widget.onTap,
            readOnly: widget.readOnly ?? false,
            decoration: widget.decoration ??
                InputDecoration(
                  hintText: widget.hintText,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.03.w,
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.03.w,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.05.w,
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Theme.of(context).dividerColor,
                  filled: true,
                  errorStyle: TextStyle(fontSize: 10.sp, color: Colors.red),
                  errorMaxLines: 3,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 1.6.h,
                    horizontal: 3.7.w,
                  ),
                  hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                ),
            controller: _controller,
            inputFormatters: widget.inputFormatter,
            autofocus: widget.autofocus,
            focusNode: _focusNode,
            textCapitalization: widget.textCapitalization,
            keyboardType: widget.keyboardType,
            cursorColor: widget.cursorColor ?? Colors.blue,
            style: widget.inputTextStyle,
            onChanged: (value) => widget.onChanged?.call(value),
            onFieldSubmitted: (value) {
              widget.onSubmitted?.call(value);
              closeOverlay();
              _focusNode.unfocus();
            },
            onEditingComplete: closeOverlay,
            validator: (p0) {
              if (widget.validator == null) {
                if (!widget.suggestions!.contains(p0)) {
                  return S.of(context).invalidOption;
                }
              } else {
                return widget.validator!(p0);
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (_overlayEntry != null) _overlayEntry!.dispose();
    if (widget.controller == null) {
      _controller
        ..removeListener(() => updateSuggestions(_controller.text))
        ..dispose();
    }
    if (_debounce != null) _debounce?.cancel();
    if (widget.focusNode == null) {
      _focusNode
        ..removeListener(() {
          if (_focusNode.hasFocus) {
            openOverlay();
          } else {
            closeOverlay();
          }
        })
        ..dispose();
    }
    super.dispose();
  }
}
