import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/routing/routers.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/theming/styles.dart';
import 'package:system/core/widgets/custom_navigation_bar_widget.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/features/login_screen/business_logic/login_cubit.dart';
import 'package:system/features/login_screen/data/models/login_request_body.dart';
import 'package:system/features/login_screen/presentation/desktop/widgets/email_and_password.dart';
import 'package:system/features/login_screen/presentation/desktop/widgets/validate_then_do.dart';
import 'package:system/features/login_screen/presentation/mobile/widgets/login_bloc_listener_mobile.dart';

class LoginScreenMobile extends StatefulWidget {
  const LoginScreenMobile({super.key});

  @override
  State<LoginScreenMobile> createState() => _LoginScreenMobileState();
}

class _LoginScreenMobileState extends State<LoginScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorsManager.lighterGray,
        body: Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/vodafone-logo.png"),
                verticalSpace(20.h),
                Text(
                  "مرحبا بك من جديد!",
                  style: TextStyles.font32BlackBold,
                ),
                verticalSpace(10.h),
                Text(
                  "تسجيل الدخول",
                  style: TextStyles.font18SecondaryColor,
                ),
                verticalSpace(15.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white),
                  child: Column(
                    children: [
                      const EmailAndPassword(),
                      verticalSpace(10.h),
                      DefaultButton(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        onPressed: () {
                          validateThenDoLogin(context);
                        },
                        child: DefaultText(
                          text: "تسجيل الدخول",
                          color: ColorsManager.lighterGray,
                          fontSize: 20.sp,
                          fontFamily: 'din',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const LoginBlocListenerMobile(),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }


}

