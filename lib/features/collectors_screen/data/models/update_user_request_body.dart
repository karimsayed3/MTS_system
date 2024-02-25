
import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_user_request_body.g.dart';
@JsonSerializable()
class UpdateUserRequestBody{
  String? username;
  String? email;
  String? password;
  int? userID;

  UpdateUserRequestBody({this.username, this.email, this.password, this.userID});

  factory UpdateUserRequestBody.fromJson(Map<String, dynamic> json) => _$UpdateUserRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserRequestBodyToJson(this);
}