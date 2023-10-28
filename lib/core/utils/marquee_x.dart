// ignore_for_file: public_member_api_docs

import 'package:dogs_dashboard/core/utils/locale_helper.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:sizer/sizer.dart';

/// A utility class for rendering a marquee text animation.
///
/// Extends [StatelessWidget] and makes use of the [Marquee] package.
/// This class provides a customizable marquee effect that scrolls text
/// across the screen.
class MarqueeX extends StatelessWidget {
  /// Constructs a new `MarqueeX` widget.
  ///
  /// Required parameters include [height], [blankSpace], and [text].
  /// Optional parameters include [velocity] for speed control and [startAfter]
  /// to delay the start of the animation.
  const MarqueeX({
    required this.height,
    required this.blankSpace,
    required this.text,
    super.key,
    this.velocity = 75,
    this.startAfter = const Duration(seconds: 1),
  });

  /// The height of the widget.
  final double height;

  /// The speed of the marquee animation.
  final double velocity;

  /// The amount of blank space between each repetition of [text].
  final double blankSpace;

  /// The text content to display in the marquee.
  final String text;

  /// The duration to wait before starting the marquee animation.
  final Duration startAfter;

  /// Builds the marquee widget.
  ///
  /// It uses the [Marquee] package to render the text, and styles it
  /// based on the current locale (Arabic or otherwise).
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Marquee(
        text: text,
        velocity: velocity,
        blankSpace: blankSpace,
        startAfter: startAfter,
        style: LocaleHelper.isArabic
            ? Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).dividerColor,
                  height: 0.12.h,
                )
            : Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).dividerColor,
                  height: 0.13.h,
                ),
      ),
    );
  }
}
