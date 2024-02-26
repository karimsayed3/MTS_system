import 'package:system/core/networking/api_error_handler.dart';
import 'package:system/core/networking/api_result.dart';
import 'package:system/core/networking/default_api_response.dart';
import 'package:system/core/networking/web_services.dart';
import 'package:system/features/subscribers_screen/data/models/activate_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/add_new_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/delete_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/disable_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/update_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/withdraw_subscriber_request_body.dart';

class SubscribersRepository {
  final WebServices webServices;
  SubscribersRepository(this.webServices);

  Future<ApiResult<DefaultApiResponse>> addNewSubscriber(AddNewSubscriberRequestBody addNewSubscriberRequestBody) async {
    try {
      final response = await webServices.addSubscriber(addNewSubscriberRequestBody);
      return ApiResult.success(response);
    }catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> updateSubscriber(UpdateSubscriberRequestBody updateSubscriberRequestBody) async {
    try {
      final response = await webServices.updateSubscriber(updateSubscriberRequestBody);
      return ApiResult.success(response);
    }catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> deleteSubscriber(DeleteSubscriberRequestBody deleteSubscriberRequestBody) async {
    try {
      final response = await webServices.deleteSubscriber(deleteSubscriberRequestBody);
      return ApiResult.success(response);
    }catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> disableSubscriber(DisableSubscriberRequestBody disableSubscriberRequestBody) async {
    try {
      final response = await webServices.disableSubscriber(disableSubscriberRequestBody);
      return ApiResult.success(response);
    }catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> withdrawSubscriber(WithdrawSubscriberRequestBody withdrawSubscriberRequestBody) async {
    try {
      final response = await webServices.withdrawSubscriber(withdrawSubscriberRequestBody);
      return ApiResult.success(response);
    }catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> activateSubscriber(ActivateSubscriberRequestBody activateSubscriberRequestBody) async {
    try {
      final response = await webServices.activateSubscriber(activateSubscriberRequestBody);
      return ApiResult.success(response);
    }catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}