import 'package:freezed_annotation/freezed_annotation.dart';

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


}

