import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/collectors_screen/data/collectors_repo/collectors_repo.dart';
import 'package:system/features/collectors_screen/data/models/get_users_request_body.dart';
import 'package:system/features/collectors_screen/data/models/get_users_response.dart';

import '../data/models/add_user_request_body.dart';
import '../data/models/deduct_balance_collector_request_body.dart';
import '../data/models/delete_user_request_body.dart';
import '../data/models/update_user_request_body.dart';
import '../data/models/zero_collector_total_request_body.dart';
import 'collectors_state.dart';


class CollectorsCubit extends Cubit<CollectorsState> {

  CollectorsRepo repository;

  CollectorsCubit(this.repository) : super(const CollectorsState.initial());

  static CollectorsCubit get(context) => BlocProvider.of(context);


  List<UserData> users = [];

  TextEditingController searchController = TextEditingController();


  Future<void> getUsers(
      {required GetUsersRequestBody getUsersRequestBody}) async {
    emit(const CollectorsState.getUsersLoadingState());
    final response = await repository.getUsers(getUsersRequestBody);
    response.when(
        success: (data) {
          emit(CollectorsState.getUsersSuccessState(data));
        },
        failure: (errorHandler) {
          emit(CollectorsState.getUsersErrorState(
              error: errorHandler.apiErrorModel.message ?? ""));
        }
    );
  }


  Future<void> addUser({required AddUserRequestBody addUserRequestBody}) async {
    emit(const CollectorsState.addUserLoadingState());
    final response = await repository.addUser(addUserRequestBody);
    response.when(
        success: (data) {
          emit(CollectorsState.addUserSuccessState(data));
        },
        failure: (errorHandler) {
          emit(CollectorsState.addUserErrorState(
              error: errorHandler.apiErrorModel.message ?? ""));
        }
    );
  }

  Future<void> updateUser(
      {required UpdateUserRequestBody updateUserRequestBody}) async {
    emit(const CollectorsState.updateUserLoadingState());

    final response = await repository.updateUser(updateUserRequestBody);
    response.when(
        success: (data) {
          emit(CollectorsState.updateUserSuccessState(data));
        },
        failure: (errorHandler) {
          emit(CollectorsState.updateUserErrorState(
              error: errorHandler.apiErrorModel.message ?? ""));
        }
    );
  }

  Future<void> deleteUser(
      {required DeleteUserRequestBody deleteUserRequestBody}) async {
    emit(const CollectorsState.deleteUserLoadingState());
    final response = await repository.deleteUser(deleteUserRequestBody);
    response.when(
        success: (data) {
          emit(CollectorsState.deleteUserSuccessState(data));
        },
        failure: (errorHandler) {
          emit(CollectorsState.deleteUserErrorState(
              error: errorHandler.apiErrorModel.message ?? ""));
        }
    );
  }


  Future<void> zeroCollectorTotal(
      {required ZeroCollectorTotalRequestBody zeroCollectorTotalRequestBody}) async {
    emit(const CollectorsState.zeroCollectorTotalLoadingState());
    final response = await repository.zeroCollectorTotal(
        zeroCollectorTotalRequestBody);
    response.when(
        success: (data) {
          emit(CollectorsState.zeroCollectorTotalSuccessState(data));
        },
        failure: (errorHandler) {
          emit(CollectorsState.zeroCollectorTotalErrorState(
              error: errorHandler.apiErrorModel.message ?? ""));
        }
    );
  }

  Future<void> deductBalanceCollector(
      {required DeductBalanceCollectorRequestBody deductBalanceCollectorRequestBody}) async {
    emit(const CollectorsState.deductBalanceCollectorLoadingState());
    final response = await repository.deductBalanceCollector(
        deductBalanceCollectorRequestBody);
    response.when(
        success: (data) {
          emit(CollectorsState.deductBalanceCollectorSuccessState(data));
        },
        failure: (errorHandler) {
          emit(CollectorsState.deductBalanceCollectorErrorState(
              error: errorHandler.apiErrorModel.message ?? ""));
        }
    );
  }

  changeListDate(List<UserData> users){
    emit(const CollectorsState.changeListData());
    this.users = users;
  }
}
