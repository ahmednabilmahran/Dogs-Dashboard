import 'package:dogs_dashboard/core/injection_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

/// A class for managing dependency injection using [GetIt] and [Injectable].
///
/// It configures dependency injection and provides an initializer
/// to set up the services and modules needed across the app.
final getIt = GetIt.instance;

/// Configures the [Injectable] settings for dependency initialization.
@InjectableInit(
  initializerName: 'init', // Default
  preferRelativeImports: true, // Default
  asExtension: true, // Default
)

/// Initializes the dependency injection.
///
/// This function should be called at the app startup
/// to make sure all dependencies are properly set up.
Future<void> configureDependencies() async => getIt.init();
