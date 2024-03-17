import 'package:system/core/networking/api_error_handler.dart';
import 'package:system/core/networking/api_result.dart';
import 'package:system/core/networking/default_api_response.dart';
import 'package:system/core/networking/models/get_lists_response.dart';
import 'package:system/core/networking/web_services.dart';
import 'package:system/features/bunches_screen/data/models/add_plan_request_body.dart';
import 'package:system/features/bunches_screen/data/models/delete_plan_request_body.dart';
import 'package:system/features/bunches_screen/data/models/get_plans_request_body.dart';
import 'package:system/features/bunches_screen/data/models/get_plans_response.dart';
import 'package:system/features/bunches_screen/data/models/update_plan_request_body.dart';

class BunchRepo {
  final WebServices webServices;

  BunchRepo(this.webServices);

  Future<ApiResult<GetPlansResponse>> getPlans(
      GetPlansRequestBody getPlansRequestBody) async {
    try {
      final response = await webServices.getPlans(getPlansRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> addPlan(
      AddPlanRequestBody addPlanRequestBody) async {
    try {
      final response = await webServices.addPlan(addPlanRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> updatePlan(
      UpdatePlanRequestBody updatePlanRequestBody) async {
    try {
      final response =
      await webServices.updatePlan(updatePlanRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> deletePlan(
      DeletePlanRequestBody deletePlanRequestBody) async {
    try {
      final response =
      await webServices.deletePlan(deletePlanRequestBody);
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
  Future<ApiResult<GetListsResponse>> getCompaniesList() async {
    try {
      final response = await webServices.getCompaniesList();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }



}
