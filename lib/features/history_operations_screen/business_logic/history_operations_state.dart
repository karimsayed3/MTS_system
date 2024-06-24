import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system/features/history_operations_screen/data/models/get_logged_operations_response.dart';

part 'history_operations_state.freezed.dart';
@freezed
class HistoryOperationsState<T> with _$HistoryOperationsState<T> {
  const factory HistoryOperationsState.initial() = _Initial;

  const factory HistoryOperationsState.getLoggedOperationsLoadingState() = GetLoggedOperationsLoadingState;

  const factory HistoryOperationsState.getLoggedOperationsSuccessState(
      GetLoggedOperationsResponse data) = GetLoggedOperationsSuccessState<T>;

  const factory HistoryOperationsState.getLoggedOperationsErrorState(
      {required String error}) = GetLoggedOperationsErrorState;

  const factory HistoryOperationsState.changeListData() = ChangeListData;

}