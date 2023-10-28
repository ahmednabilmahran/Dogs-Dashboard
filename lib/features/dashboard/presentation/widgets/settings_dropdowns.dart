import 'package:dogs_dashboard/core/utils/app_strings.dart';
import 'package:dogs_dashboard/features/splash/presentation/controllers/main_cubit/main_cubit.dart';
import 'package:dogs_dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A row of dropdown menus for changing settings.
///
/// The [SettingsDropdowns] widget displays a row containing two dropdowns:
/// one for changing the language and another for changing the theme.
/// These dropdowns interact with the [MainCubit] to update the app's state.
///
/// Example:
/// ```dart
/// SettingsDropdowns(),
/// ```
class SettingsDropdowns extends StatelessWidget {
  /// Creates a widget containing dropdowns for settings.
  const SettingsDropdowns({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      // ignore: inference_failure_on_untyped_parameter
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Dropdown for language selection
            DropdownButton<String>(
              // Currently selected language
              value: MainCubit.get(context).currentLangCode,
              // Callback for handling language change
              onChanged: (value) {
                MainCubit.get(context).changeLang(value!);
              },
              // Dropdown items for available languages
              items: [
                DropdownMenuItem(
                  value: AppStrings.englishCode,
                  child: Text(S.of(context).english),
                ),
                DropdownMenuItem(
                  value: AppStrings.arabicCode,
                  child: Text(S.of(context).arabic),
                ),
                DropdownMenuItem(
                  value: AppStrings.italianCode,
                  child: Text(S.of(context).italian),
                ),
              ],
            ),
            // Dropdown for theme selection
            DropdownButton<String>(
              // Currently selected theme
              value: MainCubit.get(context).currentThemeMode.name,
              // Callback for handling theme change
              onChanged: (value) {
                MainCubit.get(context).changeTheme(
                  themeMode: value!,
                  context: context,
                );
              },
              // Dropdown items for available themes
              items: [
                DropdownMenuItem(
                  value: AppStrings.systemName,
                  child: Text(S.of(context).system),
                ),
                DropdownMenuItem(
                  value: AppStrings.lightName,
                  child: Text(S.of(context).light),
                ),
                DropdownMenuItem(
                  value: AppStrings.darkName,
                  child: Text(S.of(context).dark),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
