import 'package:dogs_dashboard/main.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// The [SnackX] class provides a utility method to display a customized
/// [SnackBar] across the application.
class SnackX {
  /// Displays a [SnackBar] with the given [message] in the given [context].
  ///
  /// If [context] is null, it uses the [navigatorKey]
  /// to find the current context.
  ///
  /// The [SnackBar] appears for a duration of 3 seconds and supports text that
  /// spans a maximum of two lines.
  static void showSnackBar({
    required String message,
    BuildContext? context,
  }) {
    // Determine the context to use for displaying the SnackBar
    final currentContext = context ?? navigatorKey.currentContext;

    // Check if we have a valid context
    if (currentContext != null) {
      ScaffoldMessenger.of(currentContext).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: SizedBox(
            height: 4.h,
            child: Center(
              child: Text(
                message,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(currentContext).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(currentContext).hoverColor,
                    ),
              ),
            ),
          ),
          backgroundColor: Theme.of(currentContext).primaryColor,
        ),
      );
    } else {
      // Throw an exception if context is null
      throw Exception('Context is null');
    }
  }
}
