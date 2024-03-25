// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_logged_operations_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLoggedOperationsRequestBody _$GetLoggedOperationsRequestBodyFromJson(
        Map<String, dynamic> json) =>
    GetLoggedOperationsRequestBody(
      phone: json['phone'] as String?,
      relatedTo: json['relatedTo'] as String?,
      operationDateFrom: json['operationDateFrom'] as String?,
      operationDateTo: json['operationDateTo'] as String?,
      operationTypes: json['operationTypes'] as String?,
    );

Map<String, dynamic> _$GetLoggedOperationsRequestBodyToJson(
        GetLoggedOperationsRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'relatedTo': instance.relatedTo,
      'operationDateFrom': instance.operationDateFrom,
      'operationDateTo': instance.operationDateTo,
      'operationTypes': instance.operationTypes,
    };
