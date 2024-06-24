import 'package:freezed_annotation/freezed_annotation.dart';
part 'deduct_plan_from_subscribers_request_body.g.dart';
@JsonSerializable()
class DeductPlanFromSubscribersRequestBody{
  int? companyID;
  DeductPlanFromSubscribersRequestBody({
    this.companyID
  });

  Map<String, dynamic> toJson() => _$DeductPlanFromSubscribersRequestBodyToJson(this);
  fromJson(Map<String, dynamic> json) => _$DeductPlanFromSubscribersRequestBodyFromJson(json);
}