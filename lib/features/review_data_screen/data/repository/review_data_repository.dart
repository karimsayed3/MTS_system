import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/default_api_response.dart';
import '../../../../core/networking/web_services.dart';
import '../../../subscribers_screen/data/models/update_subscriber_request_body.dart';
import '../models/get_review_subscribers_plans.dart';

class ReviewDataRepository{
  final WebServices _webServices;

  ReviewDataRepository(this._webServices);


  Future<ApiResult<GetReviewSubscribersPlans>> reviewSubscribersPlans(
      File file ) async {
    try {
      final response = await _webServices.reviewSubscribersPlans(file);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> updateSubscriber(
      UpdateSubscriberRequestBody updateSubscriberRequestBody) async {
    try {
      final response =
      await _webServices.updateSubscriber(updateSubscriberRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}