import 'package:dogs_dashboard/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// A utility class for showing a shimmer loading animation.
///
/// This class leverages the `Shimmer` package to display a shimmering
/// animation over a provided child widget. It adapts to the current theme,
/// setting appropriate colors for both dark and light themes.
class ShimmerX extends StatelessWidget {
  /// Constructs a new `ShimmerX` widget.
  ///
  /// Takes a [child] widget to display the shimmer loading animation on.
  /// Optionally, a [key] can be provided for the widget.
  const ShimmerX({required this.child, super.key});

  /// The widget which the shimmer loading animation will be displayed over.
  final Widget child;

  /// Builds the shimmer loading animation.
  ///
  /// The shimmer colors adapt based on whether the application is currently
  /// using a dark or light theme.
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ThemeHelper.isDarkTheme(context)
          ? Colors.grey.shade800
          : Colors.grey.shade200,
      highlightColor: ThemeHelper.isDarkTheme(context)
          ? Colors.grey.shade600
          : Colors.white,
      child: child,
    );
  }
}
