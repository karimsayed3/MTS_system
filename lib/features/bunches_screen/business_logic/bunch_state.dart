import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system/core/networking/models/get_lists_response.dart';

import '../../../core/networking/default_api_response.dart';
import '../data/models/get_plans_response.dart';

part 'bunch_state.freezed.dart';
@freezed
class BunchState<T> with _$BunchState<T> {
  const factory BunchState.initial() = Initial;
  const factory BunchState.getPlansLoadingState() = GetPlansLoadingState;
  const factory BunchState.getPlansSuccessState(GetPlansResponse data) = GetPlansSuccessState<T>;
  const factory BunchState.getPlansErrorState({required String error}) = GetPlansErrorState;

  const factory BunchState.updatePlanLoadingState() = UpdatePlanLoadingState;
  const factory BunchState.updatePlanSuccessState(DefaultApiResponse data) = UpdatePlanSuccessState<T>;
  const factory BunchState.updatePlanErrorState({required String error}) = UpdatePlanErrorState;

  const factory BunchState.addPlanLoadingState() = AddPlanLoadingState;
  const factory BunchState.addPlanSuccessState(DefaultApiResponse data) = AddPlanSuccessState<T>;
  const factory BunchState.addPlanErrorState({required String error}) = AddPlanErrorState;

  const factory BunchState.deletePlanLoadingState() = DeletePlanLoadingState;
  const factory BunchState.deletePlanSuccessState(DefaultApiResponse data) = DeletePlanSuccessState<T>;
  const factory BunchState.deletePlanErrorState({required String error}) = DeletePlanErrorState;

  const factory BunchState.getPlansListLoadingState() = GetPlansListloadingState;
  const factory BunchState.getPlansListSuccessState(GetListsResponse getListsResponse) = GetPlansListSuccessState<T>;
  const factory BunchState.getPlansListErrorState({required String error}) =  GetPlansListErrorState;

  const factory BunchState.getCompaniesListLoadingState() = GetCompaniesListloadingState;
  const factory BunchState.getCompaniesListSuccessState(GetListsResponse getListsResponse) = GetCompaniesListSuccessState<T>;
  const factory BunchState.getCompaniesListErrorState({required String error}) =  GetCompaniesListErrorState;

  const factory BunchState.changeListData() = ChangeListData;
}

