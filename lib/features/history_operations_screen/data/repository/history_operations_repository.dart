import 'package:system/features/history_operations_screen/data/models/get_logged_operations_request_body.dart';
import 'package:system/features/history_operations_screen/data/models/get_logged_operations_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/web_services.dart';
import '../../../companies_screen/data/models/get_companies_response.dart';

class HistoryOperationsRepo {
  final WebServices webServices;

  HistoryOperationsRepo(this.webServices);

  Future<ApiResult<GetLoggedOperationsResponse>> getLoggedOperations(
      GetLoggedOperationsRequestBody getLoggedOperationsRequestBody) async {
    try {
      final response = await webServices.getLoggedOperations(
          getLoggedOperationsRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}