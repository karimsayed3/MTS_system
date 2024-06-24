import 'package:json_annotation/json_annotation.dart';

part 'get_late_subscribers_request_body.g.dart';

@JsonSerializable()
class GetLateSubscribersRequestBody {
  String? phone;
  String? name;
  String? relatedTo;
  String? collectorName;
  String? planName;
  String? monthsLate;

  GetLateSubscribersRequestBody({
    this.phone,
    this.name,
    this.relatedTo,
    this.collectorName,
    this.planName,
    this.monthsLate,
  });
  factory GetLateSubscribersRequestBody.fromJson(Map<String, dynamic> json) => _$GetLateSubscribersRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$GetLateSubscribersRequestBodyToJson(this);
}