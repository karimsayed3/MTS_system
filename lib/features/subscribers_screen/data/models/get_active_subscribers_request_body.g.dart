// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_active_subscribers_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetActiveSubscribersRequestBody _$GetActiveSubscribersRequestBodyFromJson(
        Map<String, dynamic> json) =>
    GetActiveSubscribersRequestBody(
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      relatedTo: json['relatedTo'] as String?,
      planName: json['planName'] as String?,
      lineType: json['lineType'] as String?,
    );

Map<String, dynamic> _$GetActiveSubscribersRequestBodyToJson(
        GetActiveSubscribersRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'name': instance.name,
      'relatedTo': instance.relatedTo,
      'planName': instance.planName,
      'lineType': instance.lineType,
    };
