import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system/core/networking/default_api_response.dart';
import 'package:system/core/networking/models/get_lists_response.dart';
import 'package:system/core/networking/models/results_of_uploaded_excel_model.dart';
import 'package:system/features/disabled_customers_screen/data/models/get_disabled_subscribers_response.dart';
import 'package:system/features/late_customers_screen/data/models/get_late_subscribers_response.dart';
import 'package:system/features/login_screen/data/models/login_response.dart';
import 'package:system/features/withdrawn_customers_screen/data/models/get_withdraw_subscribers_response.dart';

import '../data/models/get_subscribers_data_response.dart';

part 'subscribers_state.freezed.dart';

@freezed
class SubscribersState<T> with _$SubscribersState<T> {
  const factory SubscribersState.initial() = _Initial;
  const factory SubscribersState.addNewSubscriberLoadingState() = AddNewSubscriberloadingState;
  const factory SubscribersState.addNewSubscriberSuccessState(DefaultApiResponse defaultApiResponse) = AddNewSubscriberSuccessState<T>;
  const factory SubscribersState.addNewSubscriberErrorState({required String error}) = AddNewSubscriberErrorState;


  const factory SubscribersState.updateSubscriberLoadingState() = UpdateSubscriberloadingState;
  const factory SubscribersState.updateSubscriberSuccessState(DefaultApiResponse defaultApiResponse) = UpdateSubscriberSuccessState<T>;
  const factory SubscribersState.updateSubscriberErrorState({required String error}) = UpdateSubscriberErrorState;


  const factory SubscribersState.deleteSubscriberLoadingState() = DeleteSubscriberloadingState;
  const factory SubscribersState.deleteSubscriberSuccessState(DefaultApiResponse defaultApiResponse) = DeleteSubscriberSuccessState<T>;
  const factory SubscribersState.deleteSubscriberErrorState({required String error}) = DeleteSubscriberErrorState;


  const factory SubscribersState.disableSubscriberLoadingState() = DisableSubscriberloadingState;
  const factory SubscribersState.disableSubscriberSuccessState(DefaultApiResponse defaultApiResponse) = DisableSubscriberSuccessState<T>;
  const factory SubscribersState.disableSubscriberErrorState({required String error}) = DisableSubscriberErrorState;


  const factory SubscribersState.withdrawSubscriberLoadingState() = WithdrawSubscriberloadingState;
  const factory SubscribersState.withdrawSubscriberSuccessState(DefaultApiResponse defaultApiResponse) = WithdrawSubscriberSuccessState<T>;
  const factory SubscribersState.withdrawSubscriberErrorState({required String error}) = WithdrawSubscriberErrorState;


  const factory SubscribersState.activateSubscriberLoadingState() = ActivateSubscriberloadingState;
  const factory SubscribersState.activateSubscriberSuccessState(DefaultApiResponse defaultApiResponse) = ActivateSubscriberSuccessState<T>;
  const factory SubscribersState.activateSubscriberErrorState({required String error}) = ActivateSubscriberErrorState;


  const factory SubscribersState.zeroSubscriberBalanceLoadingState() = ZeroSubscriberBalanceloadingState;
  const factory SubscribersState.zeroSubscriberBalanceSuccessState(DefaultApiResponse defaultApiResponse) = ZeroSubscriberBalanceSuccessState<T>;
  const factory SubscribersState.zeroSubscriberBalanceErrorState({required String error}) = ZeroSubscriberBalanceErrorState;


  const factory SubscribersState.collectSubscriberBalanceLoadingState() = CollectSubscriberBalanceloadingState;
  const factory SubscribersState.collectSubscriberBalanceSuccessState(DefaultApiResponse defaultApiResponse) = CollectSubscriberBalanceSuccessState<T>;
  const factory SubscribersState.collectSubscriberBalanceErrorState({required String error}) = CollectSubscriberBalanceErrorState;


  const factory SubscribersState.getActiveSubscribersLoadingState() = GetActiveSubscribersloadingState;
  const factory SubscribersState.getActiveSubscribersSuccessState(GetSubscribersDataResponse getSubscribersDataResponse) = GetActiveSubscribersSuccessState<T>;
  const factory SubscribersState.getActiveSubscribersErrorState({required String error}) = GetActiveSubscribersErrorState;


  const factory SubscribersState.getLateSubscribersLoadingState() = GetLateSubscribersloadingState;
  const factory SubscribersState.getLateSubscribersSuccessState(GetLateSubscribersResponse getLateSubscribersResponse) = GetLateSubscribersSuccessState<T>;
  const factory SubscribersState.getLateSubscribersErrorState({required String error}) =  GetLateSubscribersErrorState;


  const factory SubscribersState.getDisabledSubscribersLoadingState() = GetDisabledSubscribersloadingState;
  const factory SubscribersState.getDisabledSubscribersSuccessState(GetDisabledSubscribersResponse getDisabledSubscribersResponse) = GetDisabledSubscribersSuccessState<T>;
  const factory SubscribersState.getDisabledSubscribersErrorState({required String error}) =  GetDisabledSubscribersErrorState;


  const factory SubscribersState.getWithdrawnSubscribersLoadingState() = GetWithdrawnSubscribersloadingState;
  const factory SubscribersState.getWithdrawnSubscribersSuccessState(GetWithdrawnSubscribersResponse getWithdrawnSubscribersResponse) = GetWithdrawnSubscribersSuccessState<T>;
  const factory SubscribersState.getWithdrawnSubscribersErrorState({required String error}) =  GetWithdrawnSubscribersErrorState;

  const factory SubscribersState.getCompaniesListLoadingState() = GetCompaniesListloadingState;
  const factory SubscribersState.getCompaniesListSuccessState(GetListsResponse getListsResponse) = GetCompaniesListSuccessState<T>;
  const factory SubscribersState.getCompaniesListErrorState({required String error}) =  GetCompaniesListErrorState;


  const factory SubscribersState.getCollectorsEmailsLoadingState() = GetCollectorsEmailsloadingState;
  const factory SubscribersState.getCollectorsEmailsSuccessState(GetListsResponse getListsResponse) = GetCollectorsEmailsSuccessState<T>;
  const factory SubscribersState.getCollectorsEmailsErrorState({required String error}) =  GetCollectorsEmailsErrorState;


  const factory SubscribersState.getPlansListLoadingState() = GetPlansListloadingState;
  const factory SubscribersState.getPlansListSuccessState(GetListsResponse getListsResponse) = GetPlansListSuccessState<T>;
  const factory SubscribersState.getPlansListErrorState({required String error}) =  GetPlansListErrorState;


  const factory SubscribersState.disableSubscribersByExcelLoadingState() = DisableSubscribersByExcelloadingState;
  const factory SubscribersState.disableSubscribersByExcelSuccessState(ResultsOfUploadedExcelModel resultsOfUploadedExcelModel) = DisableSubscribersByExcelSuccessState<T>;
  const factory SubscribersState.disableSubscribersByExcelErrorState({required String error}) =  DisableSubscribersByExcelErrorState;

  const factory SubscribersState.withdrawSubscribersByExcelLoadingState() = WithdrawSubscribersByExcelloadingState;
  const factory SubscribersState.withdrawSubscribersByExcelSuccessState(ResultsOfUploadedExcelModel resultsOfUploadedExcelModel) = WithdrawSubscribersByExcelSuccessState<T>;
  const factory SubscribersState.withdrawSubscribersByExcelErrorState({required String error}) =  WithdrawSubscribersByExcelErrorState;

  const factory SubscribersState.collectSubscriberBalanceByExcelLoadingState() = CollectSubscriberBalanceByExcelloadingState;
  const factory SubscribersState.collectSubscriberBalanceByExcelSuccessState(ResultsOfUploadedExcelModel resultsOfUploadedExcelModel) = CollectSubscriberBalanceByExcelSuccessState<T>;
  const factory SubscribersState.collectSubscriberBalanceByExcelErrorState({required String error}) =  CollectSubscriberBalanceByExcelErrorState;

  const factory SubscribersState.changeListData() = ChangeListData;


}
