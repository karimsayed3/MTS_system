
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_plan_request_body.g.dart';
@JsonSerializable()
class DeletePlanRequestBody{
  int? planID;
  DeletePlanRequestBody({
    this.planID
  });
  factory DeletePlanRequestBody.fromJson(Map<String, dynamic> json) => _$DeletePlanRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$DeletePlanRequestBodyToJson(this);
}