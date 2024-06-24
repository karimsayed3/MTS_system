import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/review_data_screen/business_logic/review_data_state.dart';

import '../../subscribers_screen/data/models/update_subscriber_request_body.dart';
import '../data/models/get_review_subscribers_plans.dart';
import '../data/repository/review_data_repository.dart';


class ReviewDataCubit extends Cubit<ReviewDataState> {
  ReviewDataRepository repository;
  ReviewDataCubit(this.repository) : super(const ReviewDataState.initial());
  static ReviewDataCubit get(context) => BlocProvider.of(context);

  List<ReviewSubscriberData> reviewSubscriberData = [];

  reviewSubscribersPlans({
   required File excel,
  })async {
    emit(const ReviewDataState.getReviewSubscribersPlansLoadingState());
    final response = await   repository.reviewSubscribersPlans(excel).then((value) {
      value.when(success: (data) {
        emit(ReviewDataState.getReviewSubscribersPlansSuccessState(data));
      }, failure: (errorHandler) {
        emit(ReviewDataState.getReviewSubscribersPlansErrorState(error: errorHandler.apiErrorModel.message??""));
      },);
    });
  }

  changeReviewSubscriberData({
    required List<ReviewSubscriberData> reviewSubscriberData
  }){
    emit(const ReviewDataState.changeListData());
    this.reviewSubscriberData = reviewSubscriberData;
  }

  void deleteItem(String key, dynamic value) {
    reviewSubscriberData.removeWhere((item) => item.phoneNo == value);
    changeReviewSubscriberData(reviewSubscriberData: reviewSubscriberData);
  }

  Future<void> updateSubscriber(
      {required UpdateSubscriberRequestBody
      updateSubscriberRequestBody}) async {
    emit(const ReviewDataState.updateSubscriberLoadingState());
    var response =
    await repository.updateSubscriber(updateSubscriberRequestBody);
    response.when(
      success: (data) {
        emit(ReviewDataState.updateSubscriberSuccessState(data));
      },
      failure: (errorHandler) {
        emit(ReviewDataState.updateSubscriberErrorState(
            error: errorHandler.apiErrorModel.message ?? ""));
      },
    );
  }
}
