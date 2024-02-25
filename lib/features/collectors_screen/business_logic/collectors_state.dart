
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/default_api_response.dart';
import '../data/models/get_users_response.dart';

part 'collectors_state.freezed.dart';

@freezed
class CollectorsState<T> with _$CollectorsState<T> {
  const factory CollectorsState.initial() = _Initial;
  const factory CollectorsState.getUsersLoadingState() = GetUsersLoadingState;
  const factory CollectorsState.getUsersSuccessState(GetUsersResponse data) = GetUsersSuccessState<T>;
  const factory CollectorsState.getUsersErrorState({required String error}) = GetUsersErrorState;

  const factory CollectorsState.addUserLoadingState() = AddUserLoadingState;
  const factory CollectorsState.addUserSuccessState(DefaultApiResponse data) = AddUserSuccessState<T>;
  const factory CollectorsState.addUserErrorState({required String error}) = AddUserErrorState;

  const factory CollectorsState.updateUserLoadingState() = UpdateUserLoadingState;
  const factory CollectorsState.updateUserSuccessState(DefaultApiResponse data) = UpdateUserSuccessState<T>;
  const factory CollectorsState.updateUserErrorState({required String error}) = UpdateUserErrorState;

  const factory CollectorsState.deleteUserLoadingState() = DeleteUserLoadingState;
  const factory CollectorsState.deleteUserSuccessState(DefaultApiResponse data) = DeleteUserSuccessState<T>;
  const factory CollectorsState.deleteUserErrorState({required String error}) = DeleteUserErrorState;

  const factory CollectorsState.zeroCollectorTotalLoadingState() = ZeroCollectorTotalLoadingState;
  const factory CollectorsState.zeroCollectorTotalSuccessState(DefaultApiResponse data) = ZeroCollectorTotalSuccessState<T>;
  const factory CollectorsState.zeroCollectorTotalErrorState({required String error}) = ZeroCollectorTotalErrorState;

  const factory CollectorsState.deductBalanceCollectorLoadingState() = DeductBalanceCollectorLoadingState;
  const factory CollectorsState.deductBalanceCollectorSuccessState(DefaultApiResponse data) = DeductBalanceCollectorSuccessState<T>;
  const factory CollectorsState.deductBalanceCollectorErrorState({required String error}) = DeductBalanceCollectorErrorState;

  const factory CollectorsState.changeListData() = ChangeListData;

}