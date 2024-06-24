// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_plan_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPlanRequestBody _$AddPlanRequestBodyFromJson(Map<String, dynamic> json) =>
    AddPlanRequestBody(
      companyName: json['companyName'] as String?,
      planName: json['planName'] as String?,
      planPrice: json['planPrice'] as int?,
    );

Map<String, dynamic> _$AddPlanRequestBodyToJson(AddPlanRequestBody instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'planName': instance.planName,
      'planPrice': instance.planPrice,
    };
