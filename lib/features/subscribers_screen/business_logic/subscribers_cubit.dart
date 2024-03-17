import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/disabled_customers_screen/data/models/get_disabled_subscribers_response.dart';
import 'package:system/features/late_customers_screen/data/models/get_late_subscribers_response.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';
import 'package:system/features/subscribers_screen/data/models/activate_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/add_new_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/delete_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/disable_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_active_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_subscribers_data_response.dart';
import 'package:system/features/subscribers_screen/data/models/update_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/withdraw_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/repository/subscribers_repository.dart';
import 'package:system/features/withdrawn_customers_screen/data/models/get_withdraw_subscribers_response.dart';

import '../data/models/collect_subscriber_balance_request_body.dart';
import '../data/models/get_disabled_subscribers_request_body.dart';
import '../data/models/get_late_subscribers_request_body.dart';
import '../data/models/get_withdrawn_subscribers_request_body.dart';
import '../data/models/zero_subscriber_balance_request_body.dart';

class SubscribersCubit extends Cubit<SubscribersState> {
  SubscribersRepository repository;

  SubscribersCubit(this.repository) : super(const SubscribersState.initial());

  static SubscribersCubit get(context) => BlocProvider.of(context);

  /// filter for activated subscribers
  TextEditingController activatedSubscriberPhone = TextEditingController();
  TextEditingController activatedSubscriberName = TextEditingController();
  TextEditingController activatedSubscriberRelatedTo = TextEditingController();
  TextEditingController activatedSubscriberPlanName = TextEditingController();
  TextEditingController activatedSubscriberLineType = TextEditingController();

  /// filter for late subscribers
  TextEditingController lateSubscriberPhone = TextEditingController();
  TextEditingController lateSubscriberName = TextEditingController();
  TextEditingController lateSubscriberRelatedTo =TextEditingController();
  TextEditingController lateSubscriberPlanName = TextEditingController();
  TextEditingController lateSubscriberCollectorName = TextEditingController();
  TextEditingController lateSubscriberMonthsLate = TextEditingController();

  /// filter for disabled subscribers
  TextEditingController disabledSubscriberPhone = TextEditingController();
  TextEditingController disabledSubscriberName = TextEditingController();
  TextEditingController disabledSubscriberRelatedTo = TextEditingController();
  TextEditingController disabledSubscriberPlanName = TextEditingController();
  TextEditingController disabledSubscriberLineType = TextEditingController();
  TextEditingController disabledSubscriberCollectorName = TextEditingController();
  TextEditingController disabledSubscriberCompanyName = TextEditingController();

  /// filter for withdrawn subscribers
  TextEditingController withdrawnSubscriberPhone =TextEditingController();
  TextEditingController withdrawnSubscriberName = TextEditingController();
  TextEditingController withdrawnSubscriberRelatedTo = TextEditingController();
  TextEditingController withdrawnSubscriberPlanName = TextEditingController();
  TextEditingController withdrawnSubscriberLineType = TextEditingController();
  TextEditingController withdrawnSubscriberCollectorName = TextEditingController();
  TextEditingController withdrawnSubscriberCompanyName = TextEditingController();

  List<SubscriberData> subscribers = [];
  List<LateSubscriberData> lateSubscribers = [];
  List<DisabledSubscriberData> disableSubscribers = [];
  List<WithdrawnSubscriberData> withdrawSubscribers = [];

  changeListData({
    required  List<SubscriberData>  subscribers
  }){
    emit(const SubscribersState.changeListData());
    this.subscribers = subscribers;
  }

  changeLateSubscriberData({
    required List<LateSubscriberData> lateSubscribers
  }){
    emit(const SubscribersState.changeListData());
    this.lateSubscribers = lateSubscribers;
  }
  changeDisabledSubscribersData({
    required List<DisabledSubscriberData> disableSubscribers
  }){
    emit(const SubscribersState.changeListData());
    this.disableSubscribers = disableSubscribers;
  }
  changeWithdrawSubscribersData({
    required List<WithdrawnSubscriberData> withdrawSubscribers
  }){
    emit(const SubscribersState.changeListData());
    this.withdrawSubscribers = withdrawSubscribers;
  }


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

  Future<void> zeroSubscriberBalance(
      {required ZeroSubscriberBalanceRequestBody
          zeroSubscriberBalanceRequestBody}) async {
    emit(const SubscribersState.zeroSubscriberBalanceLoadingState());
    var response = await repository
        .zeroSubscriberBalance(zeroSubscriberBalanceRequestBody);
    response.when(
      success: (data) {
        emit(SubscribersState.zeroSubscriberBalanceSuccessState(data));
      },
      failure: (errorHandler) {
        emit(SubscribersState.zeroSubscriberBalanceErrorState(
            error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }

  Future<void> collectSubscriberBalance(
      {required CollectSubscriberBalanceRequestBody
          collectSubscriberBalanceRequestBody}) async {
    emit(const SubscribersState.collectSubscriberBalanceLoadingState());
    var response = await repository
        .collectSubscriberBalance(collectSubscriberBalanceRequestBody);
    response.when(
      success: (data) {
        emit(SubscribersState.collectSubscriberBalanceSuccessState(data));
      },
      failure: (errorHandler) {
        emit(SubscribersState.collectSubscriberBalanceErrorState(
            error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }

  Future<void> getActiveSubscribers(
      {required GetActiveSubscribersRequestBody
          getActiveSubscribersRequestBody}) async {
    emit(const SubscribersState.getActiveSubscribersLoadingState());
    var response =
        await repository.getActiveSubscribers(getActiveSubscribersRequestBody);
    response.when(
      success: (data) {
        emit(SubscribersState.getActiveSubscribersSuccessState(data));
      },
      failure: (errorHandler) {
        emit(SubscribersState.getActiveSubscribersErrorState(
            error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }

  Future<void> getLateSubscribers(
      {required GetLateSubscribersRequestBody
          getLateSubscribersRequestBody}) async {
    emit(const SubscribersState.getLateSubscribersLoadingState());
    var response =
        await repository.getLateSubscribers(getLateSubscribersRequestBody);
    response.when(
      success: (data) {
        emit(SubscribersState.getLateSubscribersSuccessState(data));
      },
      failure: (errorHandler) {
        emit(SubscribersState.getLateSubscribersErrorState(
            error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }

  Future<void> getDisabledSubscribers(
      {required GetDisabledSubscribersRequestBody
          getDisabledSubscribersRequestBody}) async {
    emit(const SubscribersState.getDisabledSubscribersLoadingState());
    var response = await repository
        .getDisabledSubscribers(getDisabledSubscribersRequestBody);
    response.when(
      success: (data) {
        emit(SubscribersState.getDisabledSubscribersSuccessState(data));
      },
      failure: (errorHandler) {
        emit(SubscribersState.getDisabledSubscribersErrorState(
            error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }

  Future<void> getWithdrawnSubscribers(
      {required GetWithdrawnSubscribersRequestBody
          getWithdrawnSubscribersRequestBody}) async {
    emit(const SubscribersState.getWithdrawnSubscribersLoadingState());
    var response = await repository
        .getWithdrawnSubscribers(getWithdrawnSubscribersRequestBody);
    response.when(
      success: (data) {
        emit(SubscribersState.getWithdrawnSubscribersSuccessState(data));
      },
      failure: (errorHandler) {
        emit(SubscribersState.getWithdrawnSubscribersErrorState(
            error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }

  Future<void> getPlansList({
    required Map<String, dynamic> companyName,
  }) async {
    emit(const SubscribersState.getPlansListLoadingState());
    var response = await repository.getPlansList(companyName);
    response.when(success: (data) {
      emit(SubscribersState.getPlansListSuccessState(data));
    }, failure: (errorHandler) {
      emit(SubscribersState.getPlansListErrorState(
          error: errorHandler.apiErrorModel.message ?? ""));
    });
  }

  Future<void> getCompaniesList() async {
    emit(const SubscribersState.getCompaniesListLoadingState());
    var response = await repository.getCompaniesList();
    response.when(success: (data) {
      emit(SubscribersState.getCompaniesListSuccessState(data));
    }, failure: (errorHandler) {
      emit(SubscribersState.getCompaniesListErrorState(
          error: errorHandler.apiErrorModel.message ?? ""));
    });
  }

  Future<void> getCollectorsEmails() async {
    emit(const SubscribersState.getCollectorsEmailsLoadingState());
    var response = await repository.getCollectorsEmails();
    response.when(success: (data) {
      emit(SubscribersState.getCollectorsEmailsSuccessState(data));
    }, failure: (errorHandler) {
      emit(SubscribersState.getCollectorsEmailsErrorState(
          error: errorHandler.apiErrorModel.message ?? ""));
    });
  }

}
