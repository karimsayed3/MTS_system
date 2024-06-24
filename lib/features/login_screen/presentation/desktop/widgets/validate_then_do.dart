import 'package:flutter/material.dart';
import 'package:system/features/login_screen/business_logic/login_cubit.dart';
import 'package:system/features/login_screen/data/models/login_request_body.dart';

void validateThenDoLogin(BuildContext context) {
  if (LoginCubit.get(context).formKey.currentState!.validate()) {
    LoginCubit.get(context).login(
      loginRequestBody: LoginRequestBody(
        email: LoginCubit.get(context).emailController.text,
        password: LoginCubit.get(context).passwordController.text,
      ),
    );
  }
}