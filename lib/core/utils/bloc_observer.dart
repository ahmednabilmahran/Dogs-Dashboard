import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A [BlocObserver] subclass that observes various events and state changes
/// within the bloc lifecycle.
///
/// This observer will print out useful debug information to the console
/// for each lifecycle event of all BLoCs in the app.
class AppBlocObserver extends BlocObserver {
  /// Called when a new instance of a bloc is created.
  ///
  /// Overridden to log debug information.
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    debugPrint('onCreate -- ${bloc.runtimeType}');
  }

  /// Called when a new event is added to the given bloc.
  ///
  /// Overridden to log debug information.
  @override
  void onEvent(BlocBase<dynamic> bloc, Object? event) {
    super.onEvent(bloc as Bloc<dynamic, dynamic>, event);
    debugPrint('onEvent -- ${bloc.runtimeType}, $event');
  }

  /// Called whenever a [Change] occurs in any bloc.
  ///
  /// Overridden to log debug information.
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    debugPrint('onChange -- ${bloc.runtimeType}, $change');
  }

  /// Called whenever a [Transition] occurs in any bloc.
  ///
  /// Overridden to log debug information.
  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    debugPrint('onTransition -- ${bloc.runtimeType}, $transition');
  }

  /// Called whenever an [Error] is thrown in any bloc.
  ///
  /// Overridden to log debug information.
  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  /// Called when a bloc is closed.
  ///
  /// Overridden to log debug information.
  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    debugPrint('onClose -- ${bloc.runtimeType}');
  }
}
