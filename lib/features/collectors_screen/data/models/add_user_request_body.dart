import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_user_request_body.g.dart';
@JsonSerializable()
class AddUserRequestBody {
  String? username;
  String? email;
  String? password;
  String? accountType;

  AddUserRequestBody(
      {this.username, this.email, this.password, this.accountType});

  factory AddUserRequestBody.fromJson(Map<String, dynamic> json) => _$AddUserRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$AddUserRequestBodyToJson(this);
}