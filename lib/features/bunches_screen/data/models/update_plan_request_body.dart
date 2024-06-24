
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_plan_request_body.g.dart';
@JsonSerializable()
class UpdatePlanRequestBody {
  String? companyName;
  String? planName;
  int? planPrice;
  int? planID;

  UpdatePlanRequestBody({
    this.companyName,
    this.planName,
    this.planPrice,
    this.planID
  });

  factory UpdatePlanRequestBody.fromJson(Map<String, dynamic> json) => _$UpdatePlanRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$UpdatePlanRequestBodyToJson(this);
}