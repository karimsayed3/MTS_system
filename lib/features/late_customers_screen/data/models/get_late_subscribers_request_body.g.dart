// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_late_subscribers_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLateSubscribersRequestBody _$GetLateSubscribersRequestBodyFromJson(
        Map<String, dynamic> json) =>
    GetLateSubscribersRequestBody(
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      relatedTo: json['relatedTo'] as String?,
      collectorName: json['collectorName'] as String?,
      planName: json['planName'] as String?,
      monthsLate: json['monthsLate'] as String?,
    );

Map<String, dynamic> _$GetLateSubscribersRequestBodyToJson(
        GetLateSubscribersRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'name': instance.name,
      'relatedTo': instance.relatedTo,
      'collectorName': instance.collectorName,
      'planName': instance.planName,
      'monthsLate': instance.monthsLate,
    };
