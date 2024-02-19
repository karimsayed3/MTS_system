import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_plan_request_body.g.dart';
@JsonSerializable()
class AddPlanRequestBody{
  String? companyName;
  String? planName;
  int? planPrice;

  AddPlanRequestBody({
    this.companyName,
    this.planName,
    this.planPrice
  });

  factory AddPlanRequestBody.fromJson(Map<String, dynamic> json) => _$AddPlanRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$AddPlanRequestBodyToJson(this);
}