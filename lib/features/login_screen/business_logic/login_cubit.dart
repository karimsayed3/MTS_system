import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:system/features/login_screen/business_logic/login_state.dart';
import 'package:system/features/login_screen/data/models/login_request_body.dart';
import 'package:system/features/login_screen/data/repository/login_repo.dart';

import '../../../core/helpers/cache_helper.dart';
import '../../../core/helpers/check_platform.dart';
import '../../../core/networking/tokenDecode.dart';
import '../../../core/routing/routers.dart';
import '../../../core/widgets/custom_navigation_bar_widget.dart';

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
      success: (data)async {
        emit(LoginState.success(data));
        // on;
        debugPrint(data.accessToken);
        TokenDecode decodedToken = TokenDecode.fromJson(
            JwtDecoder.decode(data.accessToken!));
        print(CacheHelper.getdata(key: 'token'));
        await CacheHelper.saveData(
            key: 'token', value: data.accessToken)
            .then((value) {
          print(CacheHelper.getdata(key: 'token'));
          CacheHelper.saveData(
              key: 'userName', value: decodedToken.username)
              .then((value) {
            CacheHelper.saveData(key: "userID", value: decodedToken.userID)
                .then((value) {
              CacheHelper.saveData(
                  key: "accountType", value: decodedToken.accountType)
                  .then((value) {
                isMobile()
                    ? navigateToPage(Routes.homeDesktopScreen)
                    : navigateToPage(Routes.homeDesktopScreen);
              });
            });
          });
        });
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
      success: (data) async{
        emit(LoginState.logoutSuccess(data));
      await  CacheHelper.removeData(key: 'login');
        await CacheHelper.removeData(key: 'accessToken');
        await  CacheHelper.removeData(key: 'unit');
        await   CacheHelper.removeData(key: 'token');
        navigateToPage(Routes.loginScreenDesktop,);
      },
      failure: (errorHandler) {
        emit(LoginState.logoutError(error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }



}
