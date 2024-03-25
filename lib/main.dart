import 'dart:convert';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:system/core/helpers/cache_helper.dart';
import 'package:system/core/helpers/check_platform.dart';
import 'package:system/core/helpers/scroll_behavior.dart';
import 'package:system/core/networking/tokenDecode.dart';
import 'package:window_manager/window_manager.dart';
import 'core/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routers.dart';
import 'core/theming/colors.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:desktop_window/desktop_window.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
List<Map<String, dynamic>> openedPages = [
  {
    Routes.loginScreenDesktop: null,
  }
];


// void testWindowFunctions() async {
//   if (isMobile()) {
//     if (kDebugMode) {
//       print("Running on a mobile device.");
//     }
//   } else {
//     if (kDebugMode) {
//       print("Running on another platform (web, desktop, etc.).");
//     }
//   }
// }
// String getJsonFromJWT(String yourToken){
//   String normalizedSource = base64Url.normalize(yourToken);
//   return utf8.decode(base64Url.decode(normalizedSource));
// }
double screenWidth = 0;
double screenHeight = 0;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  // await WindowManager.instance.setFullScreen(true);


  // await testWindowFunctions();
  if (isMobile()) {
    if (kDebugMode) {
      print("Running on a mobile device.");
    }
    runApp(MTSMobileApp(
      appRouter: AppRouter(),
    ));

    // runApp(DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MTSMobileApp(
    //     appRouter: AppRouter(),
    //   ), // Wrap your app
    // ),);
  }
  else
  {
    print(CacheHelper.getdata(key: 'accountType'));
    await windowManager.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      // Hide window title bar
//     await windowManager.setTitleBarStyle(windowButtonVisibility: true,TitleBarStyle.normal);
//     await windowManager.setFullScreen(false);
      await windowManager.center();
      // await windowManager.setMinimumSize(Size(screenWidth, screenHeight));
      // await windowManager.setMaximumSize(const Size(1440, 1045));
      await windowManager.show();
      await windowManager.focus();
      await windowManager.setSkipTaskbar(false);
    });
    if (kDebugMode) {
      print("Running on another platform (web, desktop, etc.).");
    }
    runApp(MTSDesktopApp(
      appRouter: AppRouter(),
    ));
  }
}

class MTSMobileApp extends StatelessWidget {
  final AppRouter appRouter;

  const MTSMobileApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorsManager.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: ColorsManager.backgroundColor,
      systemNavigationBarColor: ColorsManager.backgroundColor,
    ));
    return ScreenUtilInit(
        designSize: const Size(412, 892),
        minTextAdapt: true,
        child: MaterialApp(
          useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          // scrollBehavior: MyCustomScrollBehavior(),
          navigatorKey: navigatorKey,
          title: 'شركة لواتة',
          theme: ThemeData(
            primaryColor: ColorsManager.primaryColor,
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}

class MTSDesktopApp extends StatelessWidget {
  final AppRouter appRouter;

  const MTSDesktopApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    // _setupWindow();
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      navigatorKey: navigatorKey,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'شركة لواتة',
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      // home: const Scaffold(
      //   body: Center(child: Text("desktop app 2"),),
      // ),
      initialRoute: Routes.loginScreenDesktop,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
