import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/resellers_requests_screen/business_logic/collectors_requests_state.dart';
import 'package:system/features/resellers_requests_screen/data/models/approve_or_decline_request_body.dart';
import 'package:system/features/resellers_requests_screen/data/models/get_collector_requests_request_body.dart';
import 'package:system/features/resellers_requests_screen/data/models/get_collector_requests_response.dart';
import 'package:system/features/resellers_requests_screen/data/repository/collectors_requests_repository.dart';


class CollectorsRequestsCubit extends Cubit<CollectorsRequestsState> {

  CollectorRequestsRepository repository;
  CollectorsRequestsCubit(this.repository) : super(const CollectorsRequestsState.initial());

  static CollectorsRequestsCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();

  List<RequestData> requestsData = [];

  changeListData({
    required List<RequestData> requestsData
  }){
    emit(const CollectorsRequestsState.changeListData());
    this.requestsData = requestsData;
  }


  Future<void> getCollectorRequests({required GetCollectorRequestsRequestBody getCollectorRequestsRequestBody}) async {
    emit(const CollectorsRequestsState.getCollectorRequestsLoadingState());
    final response = await repository.getCollectorRequests(getCollectorRequestsRequestBody);
    response.when(
        success: (data) {
          emit(CollectorsRequestsState.getCollectorRequestsSuccessState(data));
        },
        failure: (errorHandler) {
          emit(CollectorsRequestsState.getCollectorRequestsErrorState(
              error: errorHandler.apiErrorModel.message ?? ""
          ));
        }
    );
  }

  Future<void> approveRequest({required ApproveOrDeclineRequestBody approveOrDeclineRequestBody}) async {
    emit(const CollectorsRequestsState.approveRequestLoadingState());
    final response = await repository.approveRequest(approveOrDeclineRequestBody);
    response.when(
        success: (data) {
          emit(CollectorsRequestsState.approveRequestSuccessState(data));
        },
        failure: (errorHandler) {
          emit(CollectorsRequestsState.approveRequestErrorState(
              error: errorHandler.apiErrorModel.message ?? ""
          ));
        }
    );
  }


  Future<void> declineRequest({required ApproveOrDeclineRequestBody approveOrDeclineRequestBody}) async {
    emit(const CollectorsRequestsState.declineRequestLoadingState());
    final response = await repository.declineRequest(approveOrDeclineRequestBody);
    response.when(
        success: (data) {
          emit(CollectorsRequestsState.declineRequestSuccessState(data));
        },
        failure: (errorHandler) {
          emit(CollectorsRequestsState.declineRequestErrorState(
              error: errorHandler.apiErrorModel.message ?? ""
          ));
        }
    );
  }


}
