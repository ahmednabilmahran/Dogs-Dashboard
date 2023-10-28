// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// The [SizedX] class provides a collection of predefined [SizedBox] widgets
/// with varying dimensions specified as a percentage of screen size.
///
/// This class serves as a convenient way to use [SizedBox] widgets with
/// predefined dimensions for both height and width.
class SizedX {
  // Height-based SizedBox widgets

  /// Represents an empty [SizedBox].
  static Widget get zero => const SizedBox();

  /// Represents a [SizedBox] with a height of 0.5% of the screen height.
  static Widget get h0p5 => SizedBox(height: 0.5.h);

  /// Represents a [SizedBox] with a height of 1% of the screen height.
  static Widget get h1 => SizedBox(height: 1.h);

  /// Represents a [SizedBox] with a height of 1.5% of the screen height.
  static Widget get h1p5 => SizedBox(height: 1.5.h);

  /// Represents a [SizedBox] with a height of 2% of the screen height.
  static Widget get h2 => SizedBox(height: 2.h);

  /// Represents a [SizedBox] with a height of 2.5% of the screen height.
  static Widget get h2p5 => SizedBox(height: 2.5.h);

  /// Represents a [SizedBox] with a height of 3% of the screen height.
  static Widget get h3 => SizedBox(height: 3.h);

  /// Represents a [SizedBox] with a height of 4% of the screen height.
  static Widget get h4 => SizedBox(height: 4.h);

  /// Represents a [SizedBox] with a height of 5% of the screen height.
  static Widget get h5 => SizedBox(height: 5.h);

  /// Represents a [SizedBox] with a height of 6% of the screen height.
  static Widget get h6 => SizedBox(height: 6.h);

  /// Represents a [SizedBox] with a height of 7% of the screen height.
  static Widget get h7 => SizedBox(height: 7.h);

  /// Represents a [SizedBox] with a height of 8% of the screen height.
  static Widget get h8 => SizedBox(height: 8.h);

  /// Represents a [SizedBox] with a height of 16% of the screen height.
  static Widget get h16 => SizedBox(height: 16.h);

  /// Represents a [SizedBox] with a height of 20% of the screen height.
  static Widget get h20 => SizedBox(height: 20.h);

  /// Represents a [SizedBox] with a height of 25% of the screen height.
  static Widget get h25 => SizedBox(height: 25.h);

  // Width-based SizedBox widgets

  /// Represents a [SizedBox] with a width of 1% of the screen width.
  static Widget get w1 => SizedBox(width: 1.w);

  /// Represents a [SizedBox] with a width of 2% of the screen width.
  static Widget get w2 => SizedBox(width: 2.w);

  /// Represents a [SizedBox] with a width of 3% of the screen width.
  static Widget get w3 => SizedBox(width: 3.w);

  /// Represents a [SizedBox] with a width of 4% of the screen width.
  static Widget get w4 => SizedBox(width: 4.w);

  /// Represents a [SizedBox] with a width of 5% of the screen width.
  static Widget get w5 => SizedBox(width: 5.w);

  /// Represents a [SizedBox] with a width of 6% of the screen width.
  static Widget get w6 => SizedBox(width: 6.w);
}
