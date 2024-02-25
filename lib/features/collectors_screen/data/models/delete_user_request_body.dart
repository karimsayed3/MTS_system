import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_user_request_body.g.dart';
@JsonSerializable()
class DeleteUserRequestBody{
  int? userID;

  DeleteUserRequestBody({this.userID});

  factory DeleteUserRequestBody.fromJson(Map<String, dynamic> json) => _$DeleteUserRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteUserRequestBodyToJson(this);
}