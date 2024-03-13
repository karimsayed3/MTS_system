// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zero_subscriber_balance_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZeroSubscriberBalanceRequestBody _$ZeroSubscriberBalanceRequestBodyFromJson(
        Map<String, dynamic> json) =>
    ZeroSubscriberBalanceRequestBody(
      phone: json['phone'] as String?,
      collectingType: json['collectingType'] as String?,
    );

Map<String, dynamic> _$ZeroSubscriberBalanceRequestBodyToJson(
        ZeroSubscriberBalanceRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'collectingType': instance.collectingType,
    };
