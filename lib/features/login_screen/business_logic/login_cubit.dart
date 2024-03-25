import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/login_screen/business_logic/login_state.dart';
import 'package:system/features/login_screen/data/models/login_request_body.dart';
import 'package:system/features/login_screen/data/repository/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(const LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  static LoginCubit get(context) => BlocProvider.of(context);
  bool obscureText = true;

  changeObscureText() {
    obscureText = !obscureText;
    emit(const LoginState.obscureTextState());
  }

  login({required LoginRequestBody loginRequestBody}) async {
    emit(const LoginState.loading());

    final response = await loginRepo.login(loginRequestBody);
    response.when(
      success: (data) {
        emit(LoginState.success(data));
      },
      failure: (errorHandler) {
        emit(LoginState.error(error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }

  logout() async {
    emit(const LoginState.logoutLoading());

    final response = await loginRepo.logout();
    response.when(
      success: (data) {
        emit(LoginState.logoutSuccess(data));
      },
      failure: (errorHandler) {
        emit(LoginState.logoutError(error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }



}
