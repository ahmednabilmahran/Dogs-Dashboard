import 'package:dogs_dashboard/config/routes/app_routes.dart';
import 'package:dogs_dashboard/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:dogs_dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';

/// A grid of clickable dashboard options.
///
/// The [OptionsGrid] widget provides a 2x2 grid of dashboard cards,
/// each representing an option that users can click to navigate to
/// different features in the application.
///
/// Example:
/// ```dart
/// OptionsGrid(),
/// ```
class OptionsGrid extends StatelessWidget {
  /// Creates a 2x2 grid of dashboard options.
  const OptionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Shrink-wrap grid view inside parent
      shrinkWrap: true,
      // Number of columns in the grid
      crossAxisCount: 2,
      children: [
        // Dashboard card for Random Image by Breed
        DashboardCard(
          title: S.of(context).randomImageByBreed,
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.randomImageByBreedRoute,
            );
          },
        ),
        // Dashboard card for Images List by Breed
        DashboardCard(
          title: S.of(context).imagesListByBreed,
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.imagesListByBreedRoute,
            );
          },
        ),
        // Dashboard card for Random Image by Breed and Sub-Breed
        DashboardCard(
          title: S.of(context).randomImageByBreedAndSubBreed,
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.randomImageByBreedAndSubBreedRoute,
            );
          },
        ),
        // Dashboard card for Images List by Breed and Sub-Breed
        DashboardCard(
          title: S.of(context).imagesListByBreedAndSubBreed,
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.imagesListByBreedAndSubBreedRoute,
            );
          },
        ),
      ],
    );
  }
}
