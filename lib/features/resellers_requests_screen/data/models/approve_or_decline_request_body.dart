import 'package:json_annotation/json_annotation.dart';
part 'approve_or_decline_request_body.g.dart';
@JsonSerializable()
class ApproveOrDeclineRequestBody {
  int? requestID;
  ApproveOrDeclineRequestBody({ this.requestID});
  factory ApproveOrDeclineRequestBody.fromJson(Map<String, dynamic> json) => _$ApproveOrDeclineRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$ApproveOrDeclineRequestBodyToJson(this);
}