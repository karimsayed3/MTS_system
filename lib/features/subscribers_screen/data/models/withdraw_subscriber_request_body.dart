import 'package:freezed_annotation/freezed_annotation.dart';
part 'withdraw_subscriber_request_body.g.dart';
@JsonSerializable()
class WithdrawSubscriberRequestBody{
  String? phone;

  WithdrawSubscriberRequestBody({this.phone});

  factory WithdrawSubscriberRequestBody.fromJson(Map<String, dynamic> json) => _$WithdrawSubscriberRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$WithdrawSubscriberRequestBodyToJson(this);

}