// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_withdrawn_subscribers_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWithdrawnSubscribersRequestBody _$GetWithdrawnSubscribersRequestBodyFromJson(
        Map<String, dynamic> json) =>
    GetWithdrawnSubscribersRequestBody(
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      relatedTo: json['relatedTo'] as String?,
      lineType: json['lineType'] as String?,
      collectorName: json['collectorName'] as String?,
      companyName: json['companyName'] as String?,
      planName: json['planName'] as String?,
    );

Map<String, dynamic> _$GetWithdrawnSubscribersRequestBodyToJson(
        GetWithdrawnSubscribersRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'name': instance.name,
      'relatedTo': instance.relatedTo,
      'lineType': instance.lineType,
      'collectorName': instance.collectorName,
      'companyName': instance.companyName,
      'planName': instance.planName,
    };
