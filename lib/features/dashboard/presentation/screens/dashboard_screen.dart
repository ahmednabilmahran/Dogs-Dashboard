import 'package:dogs_dashboard/core/widgets/custom_app_bar.dart';
import 'package:dogs_dashboard/core/widgets/custom_padding.dart';
import 'package:dogs_dashboard/features/dashboard/presentation/widgets/options_grid.dart';
import 'package:dogs_dashboard/features/dashboard/presentation/widgets/settings_dropdowns.dart';
import 'package:dogs_dashboard/features/splash/presentation/controllers/main_cubit/main_cubit.dart';
import 'package:dogs_dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A screen that displays the main dashboard of the application.
///
/// The [DashboardScreen] widget is used to show a custom app bar,
/// a grid of options represented by cards, and settings for changing
/// the language and theme of the app.
///
/// Example:
/// ```dart
/// DashboardScreen(),
/// ```
class DashboardScreen extends StatelessWidget {
  /// Creates the dashboard screen.
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          // Custom App Bar Section
          appBar: customAppBar(
            context: context,
            title: S.of(context).dogsDashboard,
            haveBackButton: false,
          ),
          // Main Content Section
          body: const CustomPadding(
            child: Column(
              children: [
                // Grid of Options represented by Cards
                OptionsGrid(),
                // Settings for Language and Theme
                SettingsDropdowns(),
              ],
            ),
          ),
        );
      },
    );
  }
}
