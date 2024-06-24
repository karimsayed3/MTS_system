import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:system/core/networking/api_constants.dart';
import 'package:system/core/networking/default_api_response.dart';
import 'package:system/core/networking/models/get_lists_response.dart';
import 'package:system/features/bunches_screen/data/models/add_plan_request_body.dart';
import 'package:system/features/bunches_screen/data/models/delete_plan_request_body.dart';
import 'package:system/features/bunches_screen/data/models/get_plans_request_body.dart';
import 'package:system/features/bunches_screen/data/models/get_plans_response.dart';
import 'package:system/features/bunches_screen/data/models/update_plan_request_body.dart';
import 'package:system/features/collectors_screen/data/models/deduct_balance_collector_request_body.dart';
import 'package:system/features/collectors_screen/data/models/get_users_request_body.dart';
import 'package:system/features/collectors_screen/data/models/get_users_response.dart';
import 'package:system/features/collectors_screen/data/models/zero_collector_total_request_body.dart';
import 'package:system/features/companies_screen/data/models/add_company_request_body.dart';
import 'package:system/features/companies_screen/data/models/deduct_plan_from_subscribers_request_body.dart';
import 'package:system/features/companies_screen/data/models/delete_company_request_body.dart';
import 'package:system/features/companies_screen/data/models/get_companies_request_body.dart';
import 'package:system/features/companies_screen/data/models/get_companies_response.dart';
import 'package:system/features/companies_screen/data/models/undo_plan_from_subscribers_request_body.dart';
import 'package:system/features/companies_screen/data/models/update_company_request_body.dart';
import 'package:system/features/disabled_customers_screen/data/models/get_disabled_subscribers_response.dart';
import 'package:system/features/history_operations_screen/data/models/get_logged_operations_request_body.dart';
import 'package:system/features/history_operations_screen/data/models/get_logged_operations_response.dart';
import 'package:system/features/late_customers_screen/data/models/get_late_subscribers_response.dart';
import 'package:system/features/login_screen/data/models/login_request_body.dart';
import 'package:system/features/login_screen/data/models/login_response.dart';
import 'package:system/features/resellers_requests_screen/data/models/approve_or_decline_request_body.dart';
import 'package:system/features/resellers_requests_screen/data/models/get_collector_requests_request_body.dart';
import 'package:system/features/resellers_requests_screen/data/models/get_collector_requests_response.dart';
import 'package:system/features/subscribers_screen/data/models/activate_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/add_new_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/collect_subscriber_balance_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/delete_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/disable_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_active_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_disabled_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_late_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_subscribers_data_response.dart';
import 'package:system/features/subscribers_screen/data/models/get_withdrawn_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/update_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/withdraw_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/zero_subscriber_balance_request_body.dart';
import 'package:system/features/withdrawn_customers_screen/data/models/get_withdraw_subscribers_response.dart';

import '../../features/collectors_screen/data/models/add_user_request_body.dart';
import '../../features/collectors_screen/data/models/delete_user_request_body.dart';
import '../../features/collectors_screen/data/models/update_user_request_body.dart';
import '../../features/review_data_screen/data/models/get_review_subscribers_plans.dart';
import 'models/results_of_uploaded_excel_model.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  /// auth
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
  @POST(ApiConstants.logout)
  Future<LoginResponse> logout();

  /// companies
  @POST(ApiConstants.getCompanies)
  Future<GetCompaniesResponse> getCompanies(
      @Body() GetCompaniesRequestBody getCompaniesRequestBody);

  @POST(ApiConstants.addCompany)
  Future<DefaultApiResponse> addCompany(
      @Body() AddCompanyRequestBody addCompanyRequestBody);

  @POST(ApiConstants.updateCompany)
  Future<DefaultApiResponse> updateCompany(
      @Body() UpdateCompanyRequestBody updateCompanyRequestBody);

  @POST(ApiConstants.deleteCompany)
  Future<DefaultApiResponse> deleteCompany(
      @Body() DeleteCompanyRequestBody deleteCompanyRequestBody);

  @POST(ApiConstants.deductPlanFromSubscribers)
  Future<DefaultApiResponse> deductPlanFromSubscribers(
      @Body()
      DeductPlanFromSubscribersRequestBody
          deductPlanFromSubscribersRequestBody);

  @POST(ApiConstants.undoPlanFromSubscribers)
  Future<DefaultApiResponse> undoPlanFromSubscribers(
      @Body()
      UndoPlanFromSubscribersRequestBody undoPlanFromSubscribersRequestBody);

  /// plans
  @POST(ApiConstants.getPlans)
  Future<GetPlansResponse> getPlans(
      @Body() GetPlansRequestBody getPlansRequestBody);

  @POST(ApiConstants.addPlan)
  Future<DefaultApiResponse> addPlan(
      @Body() AddPlanRequestBody addPlanRequestBody);

  @POST(ApiConstants.updatePlan)
  Future<DefaultApiResponse> updatePlan(
      @Body() UpdatePlanRequestBody updatePlanRequestBody);

  @POST(ApiConstants.deletePlan)
  Future<DefaultApiResponse> deletePlan(
      @Body() DeletePlanRequestBody deletePlanRequestBody);

  /// users
  @POST(ApiConstants.addUser)
  Future<DefaultApiResponse> addUser(
      @Body() AddUserRequestBody addUserRequestBody);

  @POST(ApiConstants.updateUser)
  Future<DefaultApiResponse> updateUser(
      @Body() UpdateUserRequestBody updateUserRequestBody);

  @POST(ApiConstants.deleteUser)
  Future<DefaultApiResponse> deleteUser(
      @Body() DeleteUserRequestBody deleteUserRequestBody);

  @POST(ApiConstants.zeroCollectorTotal)
  Future<DefaultApiResponse> zeroCollectorTotal(
      @Body() ZeroCollectorTotalRequestBody zeroCollectorTotalRequestBody);

  @POST(ApiConstants.deductBalanceCollector)
  Future<DefaultApiResponse> deductBalanceCollector(
      @Body()
      DeductBalanceCollectorRequestBody deductBalanceCollectorRequestBody);

  @POST(ApiConstants.getUsers)
  Future<GetUsersResponse> getUsers(
      @Body() GetUsersRequestBody getUsersRequestBody);

  /// subscribers
  @POST(ApiConstants.addSubscriber)
  Future<DefaultApiResponse> addSubscriber(
      @Body() AddNewSubscriberRequestBody addNewSubscriberRequestBody);

  @POST(ApiConstants.updateSubscriber)
  Future<DefaultApiResponse> updateSubscriber(
      @Body() UpdateSubscriberRequestBody updateSubscriberRequestBody);

  @POST(ApiConstants.deleteSubscriber)
  Future<DefaultApiResponse> deleteSubscriber(
      @Body() DeleteSubscriberRequestBody deleteSubscriberRequestBody);

  @POST(ApiConstants.disableSubscriber)
  Future<DefaultApiResponse> disableSubscriber(
      @Body() DisableSubscriberRequestBody disableSubscriberRequestBody);

  @POST(ApiConstants.withdrawSubscriber)
  Future<DefaultApiResponse> withdrawSubscriber(
      @Body() WithdrawSubscriberRequestBody withdrawSubscriberRequestBody);


  @POST(ApiConstants.activateSubscriber)
  Future<DefaultApiResponse> activateSubscriber(
      @Body() ActivateSubscriberRequestBody activateSubscriberRequestBody);

  @POST(ApiConstants.zeroSubscriberBalance)
  Future<DefaultApiResponse> zeroSubscriberBalance(
      @Body() ZeroSubscriberBalanceRequestBody zeroSubscriberBalanceRequestBody);

  @POST(ApiConstants.collectSubscriberBalance)
  Future<DefaultApiResponse> collectSubscriberBalance(
      @Body() CollectSubscriberBalanceRequestBody collectSubscriberBalanceRequestBody);


  @POST(ApiConstants.getActiveSubscribers)
  Future<GetSubscribersDataResponse> getActiveSubscribers(
      @Body() GetActiveSubscribersRequestBody getActiveSubscribersRequestBody);

  @POST(ApiConstants.getLateSubscribers)
  Future<GetLateSubscribersResponse> getLateSubscribers(
      @Body() GetLateSubscribersRequestBody getLateSubscribersRequestBody);

  @POST(ApiConstants.getDisabledSubscribers)
  Future<GetDisabledSubscribersResponse> getDisabledSubscribers(
      @Body() GetDisabledSubscribersRequestBody getDisabledSubscribersRequestBody);


  @POST(ApiConstants.getWithdrawnSubscribers)
  Future<GetWithdrawnSubscribersResponse> getWithdrawnSubscribers(
      @Body() GetWithdrawnSubscribersRequestBody getWithdrawnSubscribersRequestBody);

  /// lists
  @POST(ApiConstants.getPlansList)
  Future<GetListsResponse> getPlansList( @Body() Map<String,dynamic> companyName);

  @GET(ApiConstants.getCompaniesList)
  Future<GetListsResponse> getCompaniesList();

  @GET(ApiConstants.getCollectorsEmails)
  Future<GetListsResponse> getCollectorsEmails();



  /// collectorRequests

  @POST(ApiConstants.getCollectorRequests)
  Future<GetCollectorRequestsResponse> getCollectorRequests( @Body() GetCollectorRequestsRequestBody getCollectorRequestsRequestBody);

  @POST(ApiConstants.declineRequest)
  Future<DefaultApiResponse> declineRequest( @Body() ApproveOrDeclineRequestBody approveOrDeclineRequestBody);

  @POST(ApiConstants.approveRequest)
  Future<DefaultApiResponse> approveRequest( @Body() ApproveOrDeclineRequestBody approveOrDeclineRequestBody);



  /// review data
  @POST("excel/reviewSubscribersPlans")
  @MultiPart()
  Future<GetReviewSubscribersPlans> reviewSubscribersPlans(@Part() File excel,);


  /// disableSubscribers
  @POST("excel/disableSubscribers")
  @MultiPart()
  Future<ResultsOfUploadedExcelModel> disableSubscribersByExcel(@Part() File excel,);


  /// withdrawSubscribers
  @POST("excel/withdrawSubscribers")
  @MultiPart()
  Future<ResultsOfUploadedExcelModel> withdrawSubscribersByExcel(@Part() File excel,);


  /// collectSubscriberBalance
  @POST("excel/collectSubscriberBalance")
  @MultiPart()
  Future<ResultsOfUploadedExcelModel> collectSubscriberBalanceByExcel(@Part() File excel,);




  /// getLoggedOperations
  @POST(ApiConstants.getLoggedOperations)
  Future<GetLoggedOperationsResponse> getLoggedOperations( @Body() GetLoggedOperationsRequestBody getLoggedOperationsRequestBody);


}
