// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_logged_operations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLoggedOperationsResponse _$GetLoggedOperationsResponseFromJson(
        Map<String, dynamic> json) =>
    GetLoggedOperationsResponse(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => LoggedOperation.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
    );

Map<String, dynamic> _$GetLoggedOperationsResponseToJson(
        GetLoggedOperationsResponse instance) =>
    <String, dynamic>{
      'totalPages': instance.totalPages,
      'result': instance.result,
    };

LoggedOperation _$LoggedOperationFromJson(Map<String, dynamic> json) =>
    LoggedOperation(
      phoneNo: json['phoneNo'] as String?,
      planName: json['planName'] as String?,
      subscriberName: json['subscriberName'] as String?,
      relatedTo: json['relatedTo'] as String?,
      userName: json['userName'] as String?,
      balanceBeforeOperation: json['balanceBeforeOperation'] as int?,
      addedAmount: json['addedAmount'] as int?,
      operationType: json['operationType'] as String?,
      operationDate: json['operationDate'] as String?,
      collectType: json['collectType'] as String?,
    );

Map<String, dynamic> _$LoggedOperationToJson(LoggedOperation instance) =>
    <String, dynamic>{
      'phoneNo': instance.phoneNo,
      'planName': instance.planName,
      'subscriberName': instance.subscriberName,
      'relatedTo': instance.relatedTo,
      'userName': instance.userName,
      'balanceBeforeOperation': instance.balanceBeforeOperation,
      'addedAmount': instance.addedAmount,
      'operationType': instance.operationType,
      'operationDate': instance.operationDate,
      'collectType': instance.collectType,
    };
