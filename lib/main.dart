import 'package:dogs_dashboard/app.dart';
import 'package:dogs_dashboard/core/injection_container.dart';
import 'package:dogs_dashboard/core/utils/bloc_observer.dart';
import 'package:dogs_dashboard/core/utils/database_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A [GlobalKey] that uniquely identifies the [ScaffoldMessengerState].
///
/// It is used to show SnackBars across the entire widget tree.
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

/// A [GlobalKey] that uniquely identifies the [NavigatorState].
///
/// It is used to navigate across the app.
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// The entry point of the application.
///
/// This function initializes various essential parts of the app such as
/// dependency injection and database, and then runs the app.
Future<void> main() async {
  // Ensures that widget-binding is initialized.
  // This is required because plugins might be called before runApp.
  WidgetsFlutterBinding.ensureInitialized();

  // Asynchronously initialize dependencies and the Hive database.
  await Future.wait([
    configureDependencies(),
    DatabaseManager.initHive(),
  ]);

  // Set the global Bloc observer for better debugging and logging.
  Bloc.observer = AppBlocObserver();

  // Run the app.
  runApp(const DogsDashboardApp());
}
