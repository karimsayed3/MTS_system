import 'dart:io';

import 'package:system/core/networking/api_error_handler.dart';
import 'package:system/core/networking/api_result.dart';
import 'package:system/core/networking/default_api_response.dart';
import 'package:system/core/networking/models/get_lists_response.dart';
import 'package:system/core/networking/models/results_of_uploaded_excel_model.dart';
import 'package:system/core/networking/web_services.dart';
import 'package:system/features/disabled_customers_screen/data/models/get_disabled_subscribers_response.dart';
import 'package:system/features/late_customers_screen/data/models/get_late_subscribers_response.dart';
import 'package:system/features/subscribers_screen/data/models/activate_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/add_new_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/collect_subscriber_balance_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/delete_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/disable_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_active_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_disabled_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_late_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_withdrawn_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/update_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/withdraw_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/zero_subscriber_balance_request_body.dart';
import 'package:system/features/withdrawn_customers_screen/data/models/get_withdraw_subscribers_response.dart';

import '../models/get_subscribers_data_response.dart';

class SubscribersRepository {
  final WebServices webServices;

  SubscribersRepository(this.webServices);

  Future<ApiResult<DefaultApiResponse>> addNewSubscriber(
      AddNewSubscriberRequestBody addNewSubscriberRequestBody) async {
    try {
      final response =
          await webServices.addSubscriber(addNewSubscriberRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ResultsOfUploadedExcelModel>> disableSubscribersByExcel(
      File file ) async {
    try {
      final response = await webServices.disableSubscribersByExcel(file);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ResultsOfUploadedExcelModel>> withdrawSubscribersByExcel(
      File file ) async {
    try {
      final response = await webServices.withdrawSubscribersByExcel(file);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ResultsOfUploadedExcelModel>> collectSubscriberBalanceByExcel(
      File file ) async {
    try {
      final response = await webServices.collectSubscriberBalanceByExcel(file);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> updateSubscriber(
      UpdateSubscriberRequestBody updateSubscriberRequestBody) async {
    try {
      final response =
          await webServices.updateSubscriber(updateSubscriberRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> deleteSubscriber(
      DeleteSubscriberRequestBody deleteSubscriberRequestBody) async {
    try {
      final response =
          await webServices.deleteSubscriber(deleteSubscriberRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> disableSubscriber(
      DisableSubscriberRequestBody disableSubscriberRequestBody) async {
    try {
      final response =
          await webServices.disableSubscriber(disableSubscriberRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> withdrawSubscriber(
      WithdrawSubscriberRequestBody withdrawSubscriberRequestBody) async {
    try {
      final response =
          await webServices.withdrawSubscriber(withdrawSubscriberRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> activateSubscriber(
      ActivateSubscriberRequestBody activateSubscriberRequestBody) async {
    try {
      final response =
          await webServices.activateSubscriber(activateSubscriberRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> zeroSubscriberBalance(
      ZeroSubscriberBalanceRequestBody zeroSubscriberBalanceRequestBody) async {
    try {
      final response = await webServices
          .zeroSubscriberBalance(zeroSubscriberBalanceRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> collectSubscriberBalance(
      CollectSubscriberBalanceRequestBody
          collectSubscriberBalanceRequestBody) async {
    try {
      final response = await webServices
          .collectSubscriberBalance(collectSubscriberBalanceRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetSubscribersDataResponse>> getActiveSubscribers(
      GetActiveSubscribersRequestBody getActiveSubscribersRequestBody) async {
    try {
      final response = await webServices
          .getActiveSubscribers(getActiveSubscribersRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetLateSubscribersResponse>> getLateSubscribers(
      GetLateSubscribersRequestBody getLateSubscribersRequestBody) async {
    try {
      final response =
          await webServices.getLateSubscribers(getLateSubscribersRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetDisabledSubscribersResponse>> getDisabledSubscribers(
      GetDisabledSubscribersRequestBody
          getDisabledSubscribersRequestBody) async {
    try {
      final response = await webServices
          .getDisabledSubscribers(getDisabledSubscribersRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetWithdrawnSubscribersResponse>> getWithdrawnSubscribers(
      GetWithdrawnSubscribersRequestBody
          getWithdrawnSubscribersRequestBody) async {
    try {
      final response = await webServices
          .getWithdrawnSubscribers(getWithdrawnSubscribersRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetListsResponse>> getCompaniesList() async {
    try {
      final response = await webServices.getCompaniesList();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<GetListsResponse>> getCollectorsEmails() async {
    try {
      final response = await webServices.getCollectorsEmails();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetListsResponse>> getPlansList(
    Map<String,dynamic> companyName
) async {
    try {
      final response = await webServices.getPlansList(companyName);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}
