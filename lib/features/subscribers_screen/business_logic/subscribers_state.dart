import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system/core/networking/default_api_response.dart';
import 'package:system/features/login_screen/data/models/login_response.dart';

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



}
