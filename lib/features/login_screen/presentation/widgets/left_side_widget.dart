import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text_form_field.dart';
import 'package:system/features/login_screen/presentation/widgets/password_validations.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/theming/styles.dart';

class LeftSideWidget extends StatefulWidget {
  LeftSideWidget({super.key});

  @override
  State<LeftSideWidget> createState() => _LeftSideWidgetState();
}

class _LeftSideWidgetState extends State<LeftSideWidget> {
  bool isObscureText = true;

  bool hasLowercase = false;

  bool hasUppercase = false;

  bool hasSpecialCharacters = false;

  bool hasNumber = false;

  bool hasMinLength = false;

  late TextEditingController passwordController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Padding(
      padding:
          EdgeInsets.only(right: dimension.width20, left: dimension.width80),
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
          Text(
            "البريد الالكترونى",
            style: TextStyles.font20BlackMedium,
          ),
          verticalSpace(dimension.height5),
          DefaultTextFormField(
            controller: emailController,
            hintText: "ادخل البريد الالكترونى",
            prefixIcon: Icon(Icons.person_2_outlined,color: ColorsManager.lightGray,),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          verticalSpace(dimension.height10),
          Text(
            "كلمة المرور",
            style: TextStyles.font20BlackMedium,
          ),
          verticalSpace(dimension.height5),
          DefaultTextFormField(
            controller: passwordController,
            hintText: "كلمة المرور",
            suffixIcon: Icon(Icons.remove_red_eye_sharp,color: ColorsManager.lightGray,),
            prefixIcon: Icon(Icons.security,color: ColorsManager.lightGray,),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },

            // prefixIcon: SizedBox(width: 10,height: 10,child: SvgPicture.asset("assets/images/security-safes.svg",color: ColorsManager.lightBlack,)),
          ),
          verticalSpace(dimension.height10),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasMinLength: hasMinLength,
            hasNumber: hasNumber,
            hasSpecialCharacters: hasSpecialCharacters,
            hasUpperCase: hasUppercase,
          ),
        ],
      ),
    );
  }
}
