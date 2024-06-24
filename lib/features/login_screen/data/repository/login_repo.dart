import 'package:system/core/networking/api_error_handler.dart';
import 'package:system/core/networking/api_result.dart';
import 'package:system/core/networking/web_services.dart';
import 'package:system/features/login_screen/data/models/login_request_body.dart';
import 'package:system/features/login_screen/data/models/login_response.dart';

class LoginRepo {
  final WebServices webServices;
  LoginRepo(this.webServices);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await webServices.login(loginRequestBody);
      return ApiResult.success(response);
    }catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<LoginResponse>> logout() async {
    try {
      final response = await webServices.logout();
      return ApiResult.success(response);
    }catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}