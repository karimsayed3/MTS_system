import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_review_subscribers_plans.g.dart';
@JsonSerializable()
class GetReviewSubscribersPlans{

  List<ReviewSubscriberData>? results;
  GetReviewSubscribersPlans({
    this.results
});

  factory GetReviewSubscribersPlans.fromJson(Map<String, dynamic> json) => _$GetReviewSubscribersPlansFromJson(json);
  Map<String, dynamic> toJson() => _$GetReviewSubscribersPlansToJson(this);

}

@JsonSerializable()
class ReviewSubscriberData{
  String? phoneNo;
  String? name;
  String? companyPlanName;
  String? systemPlanName;
  String? notes;
  ReviewSubscriberData({
    this.phoneNo,
    this.name,
    this.notes,
    this.companyPlanName,
    this.systemPlanName
});

  factory ReviewSubscriberData.fromJson(Map<String, dynamic> json) => _$ReviewSubscriberDataFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewSubscriberDataToJson(this);



}