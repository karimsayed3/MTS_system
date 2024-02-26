import 'package:freezed_annotation/freezed_annotation.dart';
part 'disable_subscriber_request_body.g.dart';
@JsonSerializable()
class DisableSubscriberRequestBody{
  String? phone;

  DisableSubscriberRequestBody({this.phone});

  factory DisableSubscriberRequestBody.fromJson(Map<String, dynamic> json) => _$DisableSubscriberRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$DisableSubscriberRequestBodyToJson(this);

}