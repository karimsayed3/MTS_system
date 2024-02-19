
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
   String? statusMessage;
   String? accessToken;

   LoginResponse({
     this.statusMessage,
     this.accessToken,
   });

   factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
   Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}