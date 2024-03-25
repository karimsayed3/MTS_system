import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/default_api_response.dart';
import '../data/models/get_review_subscribers_plans.dart';

part 'review_data_state.freezed.dart';

@freezed
class ReviewDataState<T> with _$ReviewDataState<T>  {
  const factory ReviewDataState.initial() = _Initial;
  const factory ReviewDataState.getReviewSubscribersPlansLoadingState() = GetReviewSubscribersPlansLoadingState;
  const factory ReviewDataState.getReviewSubscribersPlansSuccessState(GetReviewSubscribersPlans data) = GetReviewSubscribersPlansSuccessState<T>;
  const factory ReviewDataState.getReviewSubscribersPlansErrorState({required String error}) = GetReviewSubscribersPlansErrorState;

  const factory ReviewDataState.updateSubscriberLoadingState() = UpdateSubscriberloadingState;
  const factory ReviewDataState.updateSubscriberSuccessState(DefaultApiResponse defaultApiResponse) = UpdateSubscriberSuccessState<T>;
  const factory ReviewDataState.updateSubscriberErrorState({required String error}) = UpdateSubscriberErrorState;


  const factory ReviewDataState.changeListData() = ChangeListData;

}

