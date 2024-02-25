import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_users_request_body.g.dart';
@JsonSerializable()
class GetUsersRequestBody {
  String? username;

  GetUsersRequestBody({this.username});

  factory GetUsersRequestBody.fromJson(Map<String, dynamic> json) => _$GetUsersRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GetUsersRequestBodyToJson(this);

}