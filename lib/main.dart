import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:window_manager/window_manager.dart';
import 'core/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routers.dart';
import 'core/theming/colors.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:desktop_window/desktop_window.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
List<Map<String, dynamic>> openedPages = [
  {
    Routes.loginScreen: null,
  }
];
bool isMobile() {
  if (Platform.isIOS || Platform.isAndroid) {
    return true; // Running on iOS or Android (mobile)
  } else {
    return false; // Running on another platform (web, desktop, etc.)
  }
}

Future testWindowFunctions() async {
  // Size size = await DesktopWindow.getWindowSize();
  // print(size);
  // await DesktopWindow.setWindowSize(Size(500,500));

  // await DesktopWindow.setMinWindowSize(Size(400,400));
  // await DesktopWindow.setMaxWindowSize(Size(800,800));

  // await DesktopWindow.resetMaxWindowSize();
  // await DesktopWindow.toggleFullScreen();
  // bool isFullScreen = await DesktopWindow.getFullScreen();
  // await DesktopWindow.setFullScreen(true);
  // await DesktopWindow.setFullScreen(false);
}

void _setupWindow() async {
  // Set the initial window size
  await DesktopWindow.setWindowSize(const Size(800, 600));

  // Set the window to full screen
  await DesktopWindow.setFullScreen(true);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  // await WindowManager.instance.setFullScreen(true);
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((_) async {
    // Hide window title bar
//     await windowManager.setTitleBarStyle(windowButtonVisibility: true,TitleBarStyle.normal);
//     await windowManager.setFullScreen(false);
    await windowManager.center();
    // await windowManager.setMinimumSize(const Size(50, 50));
    // await windowManager.setMaximumSize(const Size(250, 250));
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setSkipTaskbar(false);
  });
  // await testWindowFunctions();
  if (isMobile()) {
    if (kDebugMode) {
      print("Running on a mobile device.");
    }
    runApp(DocApp(
      appRouter: AppRouter(),
    ));
  } else {
    if (kDebugMode) {
      print("Running on another platform (web, desktop, etc.).");
    }
    runApp(DocApp2(
      appRouter: AppRouter(),
    ));
  }
}

class DocApp extends StatelessWidget {
  final AppRouter appRouter;

  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'Doc App',
          theme: ThemeData(
            primaryColor: ColorsManager.primaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          home: const Scaffold(
            body: Center(
              child: Text("Mobile app 2"),
            ),
          ),
          // initialRoute: Routes.onBoardingScreen,
          // onGenerateRoute: appRouter.generateRoute,
        ));
  }
}

class DocApp2 extends StatelessWidget {
  final AppRouter appRouter;

  const DocApp2({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    // _setupWindow();

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Doc App',
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      // home: const Scaffold(
      //   body: Center(child: Text("desktop app 2"),),
      // ),
      initialRoute: Routes.loginScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
