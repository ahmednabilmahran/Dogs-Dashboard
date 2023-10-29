import 'package:flutter/material.dart';

/// A widget that displays a filterable list of items.
///
/// The [FilterableList] widget takes a list of items and displays them in a
/// scrollable list. Tapping on an item in the list triggers the [onItemTapped]
/// callback.
class FilterableList extends StatelessWidget {
  /// Creates a new [FilterableList] instance.
  ///
  /// The [items] and [onItemTapped] arguments must not be null.
  const FilterableList({
    required this.items,
    required this.onItemTapped,
    super.key,
    this.suggestionBuilder,
    this.elevation = 5,
    this.maxListHeight = 150,
    this.suggestionTextStyle = const TextStyle(),
    this.suggestionBackgroundColor,
    this.loading = false,
    this.progressIndicatorBuilder,
  });

  /// The list of items to display.
  final List<String> items;

  /// The callback function to invoke when an item is tapped.
  final void Function(String) onItemTapped;

  /// The elevation of the [Material] widget that wraps the list.
  final double elevation;

  /// The maximum height of the list.
  final double maxListHeight;

  /// The text style for the items in the list.
  final TextStyle suggestionTextStyle;

  /// The background color of the list.
  final Color? suggestionBackgroundColor;

  /// A flag to indicate whether the list is currently loading.
  final bool loading;

  /// A builder function to create a custom widget for each item.
  final Widget Function(String data)? suggestionBuilder;

  /// A builder function to create a custom loading indicator.
  final Widget? progressIndicatorBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffold = Scaffold.maybeOf(context);

    // Determine the background color of the list
    final backgroundColor = suggestionBackgroundColor ??
        scaffold?.widget.backgroundColor ??
        theme.scaffoldBackgroundColor;

    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(5),
      color: backgroundColor,
      child: Container(
        constraints: BoxConstraints(maxHeight: maxListHeight),
        child: Visibility(
          // The list should be visible only if there are items to display or
          // the list is currently loading.
          visible: items.isNotEmpty || loading,
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(5),
            itemCount: loading ? 1 : items.length,
            itemBuilder: (context, index) {
              // Display a loading indicator if the list is loading
              if (loading) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Visibility(
                    visible: progressIndicatorBuilder != null,
                    replacement: const CircularProgressIndicator(),
                    child: progressIndicatorBuilder!,
                  ),
                );
              }

              // Use the suggestionBuilder for custom item widgets if provided
              if (suggestionBuilder != null) {
                return InkWell(
                  child: suggestionBuilder!(items[index]),
                  onTap: () => onItemTapped(items[index]),
                );
              }

              // Otherwise, use the default item layout
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5),
                    child: Text(items[index], style: suggestionTextStyle),
                  ),
                  onTap: () => onItemTapped(items[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
