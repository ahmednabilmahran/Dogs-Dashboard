// Importing the main Cubit part to which this file belongs.
part of 'main_cubit.dart';

/// The base [MainState] class that all main states extend.
abstract class MainState {}

/// The initial state of the [MainCubit].
class MainInitialState extends MainState {}

/// The state representing that the locale has been fetched.
class MainGetLocaleState extends MainState {}

/// The state representing a change in the current locale.
class MainChangeLocaleState extends MainState {}

/// The state representing that no internet connection is available.
class MainNoInternetConnectionState extends MainState {}

/// The state representing that an internet connection is available.
class MainInternetConnectedState extends MainState {}

/// The state representing that the theme mode has been fetched.
class MainGetThemeModeState extends MainState {}

/// The state representing a change in the current theme mode.
class MainChangeThemeState extends MainState {}
