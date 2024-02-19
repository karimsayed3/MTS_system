import 'dart:async';

import 'package:flutter/material.dart';
import 'package:system/core/helpers/cache_helper.dart';
import 'package:system/core/routing/routers.dart';
import 'package:system/core/widgets/custom_navigation_bar_widget.dart';
import 'package:system/features/login_screen/presentation/desktop/widgets/right_side_widget.dart';

import '../widgets/left_side_widget.dart';

class LoginScreenDesktop extends StatefulWidget {
  const LoginScreenDesktop({super.key});

  @override
  State<LoginScreenDesktop> createState() => _LoginScreenDesktopState();
}

class _LoginScreenDesktopState extends State<LoginScreenDesktop> {


  @override
  void initState() {
    // TODO: implement initState
    if(CacheHelper.getdata(key: "token")  != null){
      Timer(
        const Duration(microseconds: 1),
        () {
          navigateToPage(Routes.homeDesktopScreen);
        },
      );
      // Navigator.pushReplacementNamed(context, Routes.homeDesktopScreen);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 3,child: RightSideWidget(),),
            Expanded(flex: 2,child: LeftSideWidget(),),
          ],
        ),
      ),
    );
  }
}
