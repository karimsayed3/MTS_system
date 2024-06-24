import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_plans_request_body.g.dart';

@JsonSerializable()
class GetPlansRequestBody {
  String? planName;
  String? companyName;

  GetPlansRequestBody({
    this.planName,
    this.companyName,
  });


  factory GetPlansRequestBody.fromJson(Map<String, dynamic> json) => _$GetPlansRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$GetPlansRequestBodyToJson(this);
}