import 'package:bloc/bloc.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';
import 'package:system/features/subscribers_screen/data/models/activate_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/add_new_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/delete_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/disable_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/update_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/withdraw_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/repository/subscribers_repository.dart';

class SubscribersCubit extends Cubit<SubscribersState> {
  SubscribersRepository repository;

  SubscribersCubit(this.repository) : super(const SubscribersState.initial());

  Future<void> addNewSubscriber(
      {required AddNewSubscriberRequestBody
          addNewSubscriberRequestBody}) async {
    emit(const SubscribersState.addNewSubscriberLoadingState());
    var response =
        await repository.addNewSubscriber(addNewSubscriberRequestBody);
    response.when(
      success: (data) {
        emit(SubscribersState.addNewSubscriberSuccessState(data));
      },
      failure: (errorHandler) {
        emit(SubscribersState.addNewSubscriberErrorState(
            error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }

  Future<void> updateSubscriber(
      {required UpdateSubscriberRequestBody
          updateSubscriberRequestBody}) async {
    emit(const SubscribersState.updateSubscriberLoadingState());
    var response =
        await repository.updateSubscriber(updateSubscriberRequestBody);
    response.when(
      success: (data) {
        emit(SubscribersState.updateSubscriberSuccessState(data));
      },
      failure: (errorHandler) {
        emit(SubscribersState.updateSubscriberErrorState(
            error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }

  Future<void> deleteSubscriber(
      {required DeleteSubscriberRequestBody
          deleteSubscriberRequestBody}) async {
    emit(const SubscribersState.deleteSubscriberLoadingState());
    var response =
        await repository.deleteSubscriber(deleteSubscriberRequestBody);
    response.when(
      success: (data) {
        emit(SubscribersState.deleteSubscriberSuccessState(data));
      },
      failure: (errorHandler) {
        emit(SubscribersState.deleteSubscriberErrorState(
            error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }

  Future<void> disableSubscriber(
      {required DisableSubscriberRequestBody
          disableSubscriberRequestBody}) async {
    emit(const SubscribersState.disableSubscriberLoadingState());
    var response =
        await repository.disableSubscriber(disableSubscriberRequestBody);
    response.when(
      success: (data) {
        emit(SubscribersState.disableSubscriberSuccessState(data));
      },
      failure: (errorHandler) {
        emit(SubscribersState.disableSubscriberErrorState(
            error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }


  Future<void> withdrawSubscriber(
      {required WithdrawSubscriberRequestBody
          withdrawSubscriberRequestBody}) async {
    emit(const SubscribersState.withdrawSubscriberLoadingState());
    var response =
        await repository.withdrawSubscriber(withdrawSubscriberRequestBody);
    response.when(
      success: (data) {
        emit(SubscribersState.withdrawSubscriberSuccessState(data));
      },
      failure: (errorHandler) {
        emit(SubscribersState.withdrawSubscriberErrorState(
            error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }



  Future<void> activateSubscriber(
      {required ActivateSubscriberRequestBody
          activateSubscriberRequestBody}) async {
    emit(const SubscribersState.activateSubscriberLoadingState());
    var response =
        await repository.activateSubscriber(activateSubscriberRequestBody);
    response.when(
      success: (data) {
        emit(SubscribersState.activateSubscriberSuccessState(data));
      },
      failure: (errorHandler) {
        emit(SubscribersState.activateSubscriberErrorState(
            error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }


}
