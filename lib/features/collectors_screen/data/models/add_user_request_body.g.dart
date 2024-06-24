// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUserRequestBody _$AddUserRequestBodyFromJson(Map<String, dynamic> json) =>
    AddUserRequestBody(
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      accountType: json['accountType'] as String?,
    );

Map<String, dynamic> _$AddUserRequestBodyToJson(AddUserRequestBody instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'accountType': instance.accountType,
    };
