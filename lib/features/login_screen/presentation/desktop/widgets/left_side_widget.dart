import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/routing/routers.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/custom_navigation_bar_widget.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/default_text_form_field.dart';
import 'package:system/features/login_screen/business_logic/login_cubit.dart';
import 'package:system/features/login_screen/data/models/login_request_body.dart';
import 'package:system/features/login_screen/presentation/desktop/widgets/email_and_password.dart';
import 'package:system/features/login_screen/presentation/desktop/widgets/login_bloc_listener_desktop.dart';
import 'package:system/features/login_screen/presentation/desktop/widgets/password_validations.dart';
import 'package:system/features/login_screen/presentation/desktop/widgets/validate_then_do.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/default_button.dart';

class LeftSideWidget extends StatefulWidget {
  LeftSideWidget({super.key});

  @override
  State<LeftSideWidget> createState() => _LeftSideWidgetState();
}

class _LeftSideWidgetState extends State<LeftSideWidget> {
  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              right: dimension.width20, left: dimension.width80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/vodafone-logo.png"),
              verticalSpace(dimension.height10),
              Text(
                "مرحبا بك من جديد!",
                style: TextStyles.font32BlackBold,
              ),
              verticalSpace(dimension.height10),
              Text(
                "تسجيل الدخول!",
                style: TextStyles.font24SecondaryColor,
              ),
              verticalSpace(dimension.height10),
              const EmailAndPassword(),
              verticalSpace(dimension.height20),
              DefaultButton(
                padding: EdgeInsets.symmetric(vertical: dimension.height15),
                onPressed: () {
                  validateThenDoLogin(context);
                },
                child: DefaultText(
                  text: "تسجيل الدخول",
                  color: ColorsManager.lighterGray,
                  fontSize: dimension.reduce20,
                  fontFamily: 'din',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const LoginBlocListenerDesktop(),
            ],
          ),
        ),
      ),
    );
  }
}
