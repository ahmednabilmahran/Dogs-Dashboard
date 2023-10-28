import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// A custom padding widget that provides predefined padding values.
///
/// This widget wraps around another widget and applies a consistent
/// set of padding values to it.
///
/// The padding is defined as 5% of the screen width horizontally
/// and 1% of the screen height vertically.
///
/// Example usage:
/// ```dart
/// CustomPadding(
///   child: Text('Hello, World!'),
/// )
/// ```
class CustomPadding extends StatelessWidget {
  /// Creates a [CustomPadding] widget that applies predefined padding
  /// to its [child].
  ///
  /// The [child] argument must not be null.
  const CustomPadding({required this.child, super.key});

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Applying symmetric padding
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      child: child,
    );
  }
}
