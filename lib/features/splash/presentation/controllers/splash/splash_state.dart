part of 'splash_cubit.dart';

/// Base [SplashState] class that holds the different states for
/// the [SplashCubit].
abstract class SplashState {}

/// Initial state of the [SplashCubit].
class SplashInitialState extends SplashState {}

/// State indicating the start of splash screen animations.
class SplashStartAnimationState extends SplashState {}
