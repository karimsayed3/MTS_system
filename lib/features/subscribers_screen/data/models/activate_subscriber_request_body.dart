import 'package:freezed_annotation/freezed_annotation.dart';
part 'activate_subscriber_request_body.g.dart';
@JsonSerializable()
class ActivateSubscriberRequestBody{
  String? phone;

  ActivateSubscriberRequestBody({this.phone});

  factory ActivateSubscriberRequestBody.fromJson(Map<String, dynamic> json) => _$ActivateSubscriberRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$ActivateSubscriberRequestBodyToJson(this);

}