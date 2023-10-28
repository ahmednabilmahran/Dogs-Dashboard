import 'package:flutter/material.dart';

/// The [NoGlowScroll] widget removes the glow effect typically seen
/// during overscroll in Flutter applications.
///
/// It wraps around any scrollable widget (the `child`) to remove
/// its overscroll glow effect.
class NoGlowScroll extends StatelessWidget {
  /// Creates a [NoGlowScroll] widget.
  ///
  /// The [child] argument specifies the scrollable widget
  /// whose overscroll glow effect will be removed.
  const NoGlowScroll({required this.child, super.key});

  /// The scrollable widget whose overscroll glow effect will be removed.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      // Listen for the overscroll event and disallow the glow effect.
      onNotification: (OverscrollIndicatorNotification overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: child,
    );
  }
}
