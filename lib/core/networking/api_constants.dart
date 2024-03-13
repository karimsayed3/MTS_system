class ApiConstants {
  /// base url
  static const String apiBaseUrl = "https://3vn1srv7-3000.euw.devtunnels.ms/api/";
  /// auth
  static const String login = "auth/login";
  static const String logout = "auth/logout";
  /// companies
  static const String getCompanies = "company/getCompanies";
  static const String addCompany = "company/addCompany";
  static const String updateCompany = "company/updateCompany";
  static const String deleteCompany = "company/deleteCompany";
  static const String deductPlanFromSubscribers = "company/deductPlanFromSubscribers";
  static const String undoPlanFromSubscribers = "company/undoPlanFromSubscribers";
  /// plans
  static const String getPlans = "plan/getPlans";
  static const String addPlan = "plan/addPlan";
  static const String updatePlan = "plan/updatePlan";
  static const String deletePlan = "plan/deletePlan";
  /// users
  static const String addUser = "user/addUser";
  static const String updateUser = "user/updateUser";
  static const String deleteUser = "user/deleteUser";
  static const String getUsers = "user/getUsers";
  static const String zeroCollectorTotal = "user/zeroCollectorTotal";
  static const String deductBalanceCollector = "user/deductBalanceCollector";

  /// subscribers
  static const String addSubscriber = "subscriber/addNewSubscriber";
  static const String updateSubscriber = "subscriber/updateSubscriber";
  static const String deleteSubscriber = "subscriber/deleteSubscriber";
  static const String disableSubscriber = "subscriber/disableSubscriber";
  static const String withdrawSubscriber = "subscriber/withdrawSubscriber";
  static const String activateSubscriber = "subscriber/activateSubscriber";
  static const String zeroSubscriberBalance = "subscriber/zeroSubscriberBalance";
  static const String collectSubscriberBalance = "subscriber/collectSubscriberBalance";
  static const String getActiveSubscribers = "subscriber/getActiveSubscribers";
  static const String getLateSubscribers = "subscriber/getLateSubscribers";
  static const String getDisabledSubscribers = "subscriber/getDisabledSubscribers";
  static const String getWithdrawnSubscribers = "subscriber/getWithdrawnSubscribers";


  /// lists
  static const String getCompaniesList = "lists/getCompanies";
  static const String getPlansList = "lists/getPlans";
  static const String getCollectorsEmails = "lists/getCollectorsEmails";

  /// collectorRequests
  static const String approveRequest = "collectoRequests/approveRequest";
  static const String declineRequest = "collectoRequests/declineRequest";
  static const String getCollectorRequests = "collectoRequests/getCollectorRequests";


}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}