import 'package:dogs_dashboard/config/routes/app_pages.dart';
import 'package:dogs_dashboard/config/themes/app_theme.dart';
import 'package:dogs_dashboard/config/themes/app_theme_dark.dart';
import 'package:dogs_dashboard/core/injection_container.dart';
import 'package:dogs_dashboard/core/utils/app_strings.dart';
import 'package:dogs_dashboard/core/utils/no_glow.dart';
import 'package:dogs_dashboard/features/splash/domain/usecases/change_lang.dart';
import 'package:dogs_dashboard/features/splash/domain/usecases/change_theme_mode.dart';
import 'package:dogs_dashboard/features/splash/domain/usecases/get_all_breeds_usecase.dart';
import 'package:dogs_dashboard/features/splash/domain/usecases/get_saved_lang.dart';
import 'package:dogs_dashboard/features/splash/domain/usecases/get_saved_theme_mode.dart';
import 'package:dogs_dashboard/features/splash/presentation/controllers/main_cubit/main_cubit.dart';
import 'package:dogs_dashboard/generated/l10n.dart';
import 'package:dogs_dashboard/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';

/// The [DogsDashboardApp] class serves as the root of the application.
///
/// It sets up the necessary BlocProvider,
/// localization,
/// theme
/// and routing configurations.
class DogsDashboardApp extends StatelessWidget {
  /// Constructor
  const DogsDashboardApp({super.key});

  /// Builds the application widget tree.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(
        getIt<GetAllBreedsUseCase>(),
        getIt<GetSavedLangUseCase>(),
        getIt<ChangeLangUseCase>(),
        getIt<GetSavedThemeModeUseCase>(),
        getIt<ChangeThemeModeUseCase>(),
      )
        ..getAllBreeds()
        ..getSavedLang()
        ..checkConnectivity()
        ..getSavedThemeMode(),
      child: Sizer(
        builder: (context, orientation, deviceType) => NoGlowScroll(
          child: BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              return MaterialApp(
                scaffoldMessengerKey: rootScaffoldMessengerKey,
                navigatorKey: navigatorKey,
                title: AppStrings.appName,
                locale: Locale(MainCubit.get(context).currentLangCode),
                debugShowCheckedModeBanner: false,
                theme: AppTheme.theme(
                  MainCubit.get(context).currentLangCode,
                ),
                darkTheme: AppThemeDark.theme(
                  MainCubit.get(context).currentLangCode,
                ),
                themeMode: MainCubit.get(context).currentThemeMode,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
