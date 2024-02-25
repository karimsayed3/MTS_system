// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deduct_balance_collector_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeductBalanceCollectorRequestBody _$DeductBalanceCollectorRequestBodyFromJson(
        Map<String, dynamic> json) =>
    DeductBalanceCollectorRequestBody(
      userID: json['userID'] as int?,
      collectingType: json['collectingType'] as String?,
      collectedAmount: json['collectedAmount'] as int?,
    );

Map<String, dynamic> _$DeductBalanceCollectorRequestBodyToJson(
        DeductBalanceCollectorRequestBody instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'collectingType': instance.collectingType,
      'collectedAmount': instance.collectedAmount,
    };
