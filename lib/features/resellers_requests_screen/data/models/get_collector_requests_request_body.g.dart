// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collector_requests_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCollectorRequestsRequestBody _$GetCollectorRequestsRequestBodyFromJson(
        Map<String, dynamic> json) =>
    GetCollectorRequestsRequestBody(
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      requestTypes: json['requestTypes'] as String?,
    );

Map<String, dynamic> _$GetCollectorRequestsRequestBodyToJson(
        GetCollectorRequestsRequestBody instance) =>
    <String, dynamic>{
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'requestTypes': instance.requestTypes,
    };
