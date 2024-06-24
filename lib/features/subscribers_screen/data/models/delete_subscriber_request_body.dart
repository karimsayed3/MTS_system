import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_subscriber_request_body.g.dart';
@JsonSerializable()
class DeleteSubscriberRequestBody{
  String? phone;

  DeleteSubscriberRequestBody({this.phone});

  factory DeleteSubscriberRequestBody.fromJson(Map<String, dynamic> json) => _$DeleteSubscriberRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteSubscriberRequestBodyToJson(this);

}