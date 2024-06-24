// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_plan_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePlanRequestBody _$UpdatePlanRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdatePlanRequestBody(
      companyName: json['companyName'] as String?,
      planName: json['planName'] as String?,
      planPrice: json['planPrice'] as int?,
      planID: json['planID'] as int?,
    );

Map<String, dynamic> _$UpdatePlanRequestBodyToJson(
        UpdatePlanRequestBody instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'planName': instance.planName,
      'planPrice': instance.planPrice,
      'planID': instance.planID,
    };
