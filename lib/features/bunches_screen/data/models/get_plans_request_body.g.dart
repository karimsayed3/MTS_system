// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_plans_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPlansRequestBody _$GetPlansRequestBodyFromJson(Map<String, dynamic> json) =>
    GetPlansRequestBody(
      planName: json['planName'] as String?,
      companyName: json['companyName'] as String?,
    );

Map<String, dynamic> _$GetPlansRequestBodyToJson(
        GetPlansRequestBody instance) =>
    <String, dynamic>{
      'planName': instance.planName,
      'companyName': instance.companyName,
    };
