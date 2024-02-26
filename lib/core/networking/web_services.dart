import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:system/core/networking/api_constants.dart';
import 'package:system/core/networking/default_api_response.dart';
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
import 'package:system/features/login_screen/data/models/login_request_body.dart';
import 'package:system/features/login_screen/data/models/login_response.dart';
import 'package:system/features/subscribers_screen/data/models/activate_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/add_new_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/delete_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/disable_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/update_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/withdraw_subscriber_request_body.dart';

import '../../features/collectors_screen/data/models/add_user_request_body.dart';
import '../../features/collectors_screen/data/models/delete_user_request_body.dart';
import '../../features/collectors_screen/data/models/update_user_request_body.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  /// auth
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

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



}
