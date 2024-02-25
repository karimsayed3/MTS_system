// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserRequestBody _$UpdateUserRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateUserRequestBody(
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      userID: json['userID'] as int?,
    );

Map<String, dynamic> _$UpdateUserRequestBodyToJson(
        UpdateUserRequestBody instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'userID': instance.userID,
    };
