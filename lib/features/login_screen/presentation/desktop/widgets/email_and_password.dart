import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/widgets/default_text_form_field.dart';
import 'package:system/features/login_screen/business_logic/login_cubit.dart';
import 'package:system/features/login_screen/presentation/desktop/widgets/password_validations.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController passwordController;
  bool isObscureText = true;

  bool hasLowercase = false;

  bool hasUppercase = false;

  bool hasSpecialCharacters = false;

  bool hasNumber = false;

  bool hasMinLength = false;

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
  void initState() {
    super.initState();
    passwordController = LoginCubit.get(context).passwordController;
    // emailController = TextEditingController();
    setupPasswordControllerListener();
  }

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Form(
      key: LoginCubit.get(context).formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "البريد الالكترونى",
            style: TextStyles.font20BlackMedium,
          ),
          verticalSpace(dimension.height10),
          DefaultTextFormField(
            controller: LoginCubit.get(context).emailController,
            hintText: "البريد الالكترونى",
            prefixIcon: const Icon(
              Icons.person_2_outlined,
              color: ColorsManager.lightGray,
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'من فضلك ادخل بريد الكترونى صحيح';
              }
            },
          ),
          verticalSpace(dimension.height15),
          Text(
            "كلمة المرور",
            style: TextStyles.font20BlackMedium,
          ),
          verticalSpace(dimension.height10),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return DefaultTextFormField(
                obscureText: LoginCubit.get(context).obscureText,
                controller: LoginCubit.get(context).passwordController,
                hintText: "كلمة المرور",
                suffixIcon: InkWell(
                  onTap: () {
                    LoginCubit.get(context).changeObscureText();
                  },
                  child: const Icon(
                    Icons.remove_red_eye_sharp,
                    color: ColorsManager.lightGray,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.security,
                  color: ColorsManager.lightGray,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'من فضلك ادخل كلمة المرور';
                  }
                },
              );
            },
          ),
          // verticalSpace(dimension.height10),
          // PasswordValidations(
          //   hasLowerCase: hasLowercase,
          //   hasMinLength: hasMinLength,
          //   hasNumber: hasNumber,
          //   hasSpecialCharacters: hasSpecialCharacters,
          //   hasUpperCase: hasUppercase,
          // ),
        ],
      ),
    );
  }
}
