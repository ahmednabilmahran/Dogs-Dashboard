import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Represents a dashboard card that is tappable.
///
/// The [DashboardCard] widget is a [StatelessWidget] which encapsulates
/// a [Card] with a title. When tapped, it invokes the [onTap] callback.
/// The [title] property defines the text displayed at the center of the card.
///
/// Example:
/// ```dart
/// DashboardCard(
///   title: 'My Card',
///   onTap: () => print('Card tapped'),
/// )
/// ```
class DashboardCard extends StatelessWidget {
  /// Creates a tappable dashboard card.
  ///
  /// The [title] argument defines the text displayed on the card.
  /// The [onTap] callback is invoked when the card is tapped.
  const DashboardCard({
    required this.title,
    required this.onTap,
    super.key,
  });

  /// The title text displayed at the center of the card.
  final String title;

  /// The callback function to be executed when the card is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        // Wrap the content with Padding for inner spacing
        child: Padding(
          padding: EdgeInsets.all(5.sp),
          // Center the title text within the card
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
