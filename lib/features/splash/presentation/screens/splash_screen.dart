import 'package:dogs_dashboard/core/utils/assets.dart';
import 'package:dogs_dashboard/features/splash/presentation/controllers/splash/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Splash Screen
class SplashScreen extends StatefulWidget {
  /// Constructor
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return BlocProvider(
      create: (context) =>
          SplashCubit()..startAnimation(context: context, vsync: this),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          final cubit = SplashCubit.get(context);
          return Scaffold(
            backgroundColor: cubit.colorsAnimation.value,
            body: ScaleTransition(
              scale: cubit.secondAnimation,
              child: ScaleTransition(
                scale: cubit.firstAnimation,
                child: Center(
                  child: Image.asset(
                    Assets.imagesLogoSplash,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
