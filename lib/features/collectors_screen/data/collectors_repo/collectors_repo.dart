import 'package:system/core/networking/api_error_handler.dart';
import 'package:system/core/networking/api_result.dart';
import 'package:system/core/networking/default_api_response.dart';
import 'package:system/core/networking/web_services.dart';
import 'package:system/features/collectors_screen/data/models/add_user_request_body.dart';
import 'package:system/features/collectors_screen/data/models/deduct_balance_collector_request_body.dart';
import 'package:system/features/collectors_screen/data/models/get_users_request_body.dart';
import 'package:system/features/collectors_screen/data/models/get_users_response.dart';
import 'package:system/features/collectors_screen/data/models/zero_collector_total_request_body.dart';
import '../models/delete_user_request_body.dart';
import '../models/update_user_request_body.dart';

class CollectorsRepo {
  final WebServices _webServices;

  CollectorsRepo(this._webServices);

  Future<ApiResult<DefaultApiResponse>> addUser(
      AddUserRequestBody addUserRequestBody) async {
    try {
      final response = await _webServices.addUser(addUserRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  Future<ApiResult<DefaultApiResponse>> updateUser(
      UpdateUserRequestBody updateUserRequestBody) async {
    try {
      final response = await _webServices.updateUser(updateUserRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> deleteUser(
      DeleteUserRequestBody deleteUserRequestBody) async {
    try {
      final response = await _webServices.deleteUser(deleteUserRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> zeroCollectorTotal(
      ZeroCollectorTotalRequestBody zeroCollectorTotalRequestBody) async {
    try {
      final response = await _webServices.zeroCollectorTotal(zeroCollectorTotalRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> deductBalanceCollector(
      DeductBalanceCollectorRequestBody deductBalanceCollectorRequestBody) async {
    try {
      final response = await _webServices.deductBalanceCollector(deductBalanceCollectorRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetUsersResponse>> getUsers(
      GetUsersRequestBody getUsersRequestBody) async {
    try {
      final response = await _webServices.getUsers(getUsersRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}
