import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/animation_test_screen.dart';
import 'package:system/features/customers_screen/presentation/screen/customers_screen.dart';
import 'package:system/features/home_screen/presentation/desktop/screen/home_screen_desktop.dart';
import 'package:system/features/home_screen/presentation/mobile/screen/home_screen_mobile.dart';
import 'package:system/features/login_screen/business_logic/login_cubit.dart';
import 'package:system/features/login_screen/presentation/desktop/screen/login_screen.dart';
import 'package:system/features/login_screen/presentation/mobile/screen/login_screen_mobile.dart';
import 'package:system/features/splash_screen/presentation/screen/splash_screen.dart';
import '../../print_page.dart';
import 'routers.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeDesktopScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                value: getIt<LoginCubit>(),
                child: const HomeDesktopScreen(),
              ),
        );
      case Routes.homeMobileScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                value: getIt<LoginCubit>(),
                child: const HomeScreenMobile(),
              ),
        );
      case Routes.customersScreen:
        return MaterialPageRoute(
          builder: (_) => CustomersScreen(),
        );
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.loginScreenDesktop:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreenDesktop(),
              ),
        );
      case Routes.loginScreenMobile:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreenMobile(),
              ),
        );
      case Routes.printerScreen:
        final imgPath = settings.arguments as Map<dynamic,dynamic>;

        return MaterialPageRoute(
          builder: (_) => PrintersView(
            imgPath: imgPath['imgPath'],
          ),
        );
    // case Routes.signUpScreen:
    //   return MaterialPageRoute(
    //     builder: (_) => BlocProvider(
    //       create: (context) => getIt<SignupCubit>(),
    //       child: const SignupScreen(),
    //     ),
    //   );
    // case Routes.homeScreen:
    //   return MaterialPageRoute(
    //     builder: (_) => const HomeScreen(),
    //   );

      case Routes.animationTestScreen:
        return MaterialPageRoute(
          builder: (_) => const AnimationTestScreen(),
        );
    }
    return null;
  }
}
