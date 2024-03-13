// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_disabled_subscribers_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDisabledSubscribersRequestBody _$GetDisabledSubscribersRequestBodyFromJson(
        Map<String, dynamic> json) =>
    GetDisabledSubscribersRequestBody(
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      relatedTo: json['relatedTo'] as String?,
      lineType: json['lineType'] as String?,
      collectorName: json['collectorName'] as String?,
      companyName: json['companyName'] as String?,
      planName: json['planName'] as String?,
    );

Map<String, dynamic> _$GetDisabledSubscribersRequestBodyToJson(
        GetDisabledSubscribersRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'name': instance.name,
      'relatedTo': instance.relatedTo,
      'lineType': instance.lineType,
      'collectorName': instance.collectorName,
      'companyName': instance.companyName,
      'planName': instance.planName,
    };
