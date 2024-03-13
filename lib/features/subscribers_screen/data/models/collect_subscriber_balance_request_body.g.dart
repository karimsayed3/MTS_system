// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect_subscriber_balance_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectSubscriberBalanceRequestBody
    _$CollectSubscriberBalanceRequestBodyFromJson(Map<String, dynamic> json) =>
        CollectSubscriberBalanceRequestBody(
          phone: json['phone'] as String?,
          collectingType: json['collectingType'] as String?,
          amount: json['amount'] as int?,
        );

Map<String, dynamic> _$CollectSubscriberBalanceRequestBodyToJson(
        CollectSubscriberBalanceRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'collectingType': instance.collectingType,
      'amount': instance.amount,
    };
