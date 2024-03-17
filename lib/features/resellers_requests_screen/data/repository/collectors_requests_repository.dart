import 'package:system/core/networking/api_result.dart';
import 'package:system/core/networking/default_api_response.dart';
import 'package:system/features/companies_screen/data/models/get_companies_response.dart';
import 'package:system/features/resellers_requests_screen/data/models/approve_or_decline_request_body.dart';
import 'package:system/features/resellers_requests_screen/data/models/get_collector_requests_request_body.dart';
import 'package:system/features/resellers_requests_screen/data/models/get_collector_requests_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/web_services.dart';

class CollectorRequestsRepository {

  final WebServices _webServices;

  CollectorRequestsRepository(this._webServices);


  Future<ApiResult<GetCollectorRequestsResponse>> getCollectorRequests(
      GetCollectorRequestsRequestBody getCollectorRequestsRequestBody) async {
    try {
      final response = await _webServices.getCollectorRequests(getCollectorRequestsRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> approveRequest(
      ApproveOrDeclineRequestBody approveOrDeclineRequestBody) async {
    try {
      final response = await _webServices.approveRequest(approveOrDeclineRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<DefaultApiResponse>> declineRequest(
      ApproveOrDeclineRequestBody approveOrDeclineRequestBody) async {
    try {
      final response = await _webServices.declineRequest(approveOrDeclineRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }



}