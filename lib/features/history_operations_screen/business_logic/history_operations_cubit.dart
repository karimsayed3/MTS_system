import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:system/features/history_operations_screen/data/models/get_logged_operations_request_body.dart';
import 'package:system/features/history_operations_screen/data/models/get_logged_operations_response.dart';

import '../data/repository/history_operations_repository.dart';
import 'history_operations_state.dart';

class HistoryOperationsCubit extends Cubit<HistoryOperationsState> {
  HistoryOperationsRepo repository;

  HistoryOperationsCubit(this.repository)
      : super(const HistoryOperationsState.initial());

  static HistoryOperationsCubit get(context) => BlocProvider.of(context);

  List<LoggedOperation> loggedOperations = [];
  int pageNumber = 1;
  bool hasMore = true;
  bool isLoading = false;


  changeListData({
    required List<LoggedOperation> loggedOperations
  }){
    emit(const HistoryOperationsState.changeListData());
    this.loggedOperations =  loggedOperations;
  }

  Future<void> getLoggedOperations({
    required
    GetLoggedOperationsRequestBody getLoggedOperationsRequestBody
}) async {
    emit(const HistoryOperationsState.getLoggedOperationsLoadingState());
    var response =
        await repository.getLoggedOperations(getLoggedOperationsRequestBody);
    response.when(success: (data) {
      emit(HistoryOperationsState.getLoggedOperationsSuccessState(data));
    }, failure: (errorHandler) {
      emit(HistoryOperationsState.getLoggedOperationsErrorState(
          error: errorHandler.apiErrorModel.message ?? ""));
    });
  }
}
