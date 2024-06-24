import 'package:system/core/networking/api_error_handler.dart';
import 'package:system/core/networking/api_result.dart';
import 'package:system/core/networking/default_api_response.dart';
import 'package:system/core/networking/web_services.dart';
import 'package:system/features/companies_screen/data/models/add_company_request_body.dart';
import 'package:system/features/companies_screen/data/models/deduct_plan_from_subscribers_request_body.dart';
import 'package:system/features/companies_screen/data/models/delete_company_request_body.dart';
import 'package:system/features/companies_screen/data/models/get_companies_request_body.dart';
import 'package:system/features/companies_screen/data/models/get_companies_response.dart';
import 'package:system/features/companies_screen/data/models/undo_plan_from_subscribers_request_body.dart';
import 'package:system/features/companies_screen/data/models/update_company_request_body.dart';

class CompaniesRepo {
  final WebServices webServices;

  CompaniesRepo(this.webServices);

  Future<ApiResult<GetCompaniesResponse>> getCompanies(
      GetCompaniesRequestBody getCompaniesRequestBody) async {
    try {
      final response = await webServices.getCompanies(getCompaniesRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> addCompany(
      AddCompanyRequestBody addCompanyRequestBody) async {
    try {
      final response = await webServices.addCompany(addCompanyRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> updateCompany(
      UpdateCompanyRequestBody updateCompanyRequestBody) async {
    try {
      final response =
          await webServices.updateCompany(updateCompanyRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> deleteCompany(
      DeleteCompanyRequestBody deleteCompanyRequestBody) async {
    try {
      final response =
          await webServices.deleteCompany(deleteCompanyRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> deductPlanFromSubscribers(
      DeductPlanFromSubscribersRequestBody
          deductPlanFromSubscribersRequestBody) async {
    try {
      final response = await webServices
          .deductPlanFromSubscribers(deductPlanFromSubscribersRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultApiResponse>> undoPlanFromSubscribers(
      UndoPlanFromSubscribersRequestBody
          undoPlanFromSubscribersRequestBody) async {
    try {
      final response = await webServices
          .undoPlanFromSubscribers(undoPlanFromSubscribersRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
