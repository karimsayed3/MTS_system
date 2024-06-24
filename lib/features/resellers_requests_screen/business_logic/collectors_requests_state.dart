import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system/core/networking/default_api_response.dart';
import 'package:system/features/resellers_requests_screen/data/models/get_collector_requests_response.dart';

part 'collectors_requests_state.freezed.dart';

@freezed
class CollectorsRequestsState<T> with _$CollectorsRequestsState<T> {
  const factory CollectorsRequestsState.initial() = _Initial;
  const factory CollectorsRequestsState.getCollectorRequestsLoadingState() = GetCollectorRequestsLoadingState;
  const factory CollectorsRequestsState.getCollectorRequestsSuccessState(GetCollectorRequestsResponse data) = GetCollectorRequestsSuccessState<T>;
  const factory CollectorsRequestsState.getCollectorRequestsErrorState({required String error}) = GetCollectorRequestsErrorState;

  const factory CollectorsRequestsState.approveRequestLoadingState() = ApproveRequestLoadingState;
  const factory CollectorsRequestsState.approveRequestSuccessState(DefaultApiResponse data) = ApproveRequestSuccessState<T>;
  const factory CollectorsRequestsState.approveRequestErrorState({required String error}) = ApproveRequestErrorState;

  const factory CollectorsRequestsState.declineRequestLoadingState() = DeclineRequestLoadingState;
  const factory CollectorsRequestsState.declineRequestSuccessState(DefaultApiResponse data) = DeclineRequestSuccessState<T>;
  const factory CollectorsRequestsState.declineRequestErrorState({required String error}) = DeclineRequestErrorState;

  const factory CollectorsRequestsState.changeListData() = ChangeListData;

}
