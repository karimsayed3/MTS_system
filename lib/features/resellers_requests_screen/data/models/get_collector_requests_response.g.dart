// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collector_requests_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCollectorRequestsResponse _$GetCollectorRequestsResponseFromJson(
        Map<String, dynamic> json) =>
    GetCollectorRequestsResponse(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => RequestData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCollectorRequestsResponseToJson(
        GetCollectorRequestsResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

RequestData _$RequestDataFromJson(Map<String, dynamic> json) => RequestData(
      phoneNo: json['phoneNo'] as String?,
      name: json['name'] as String?,
      balance: json['balance'] as int?,
      relatedTo: json['relatedTo'] as String?,
      oldValue: json['oldValue'] as String?,
      requestType: json['requestType'] as String?,
      newValue: json['newValue'] as String?,
      requestDate: json['requestDate'] as String?,
      actionDate: json['actionDate'] as String?,
      requestStatus: json['requestStatus'] as String?,
      requestID: json['requestID'] as int?,
    );

Map<String, dynamic> _$RequestDataToJson(RequestData instance) =>
    <String, dynamic>{
      'phoneNo': instance.phoneNo,
      'name': instance.name,
      'balance': instance.balance,
      'relatedTo': instance.relatedTo,
      'oldValue': instance.oldValue,
      'requestType': instance.requestType,
      'newValue': instance.newValue,
      'requestDate': instance.requestDate,
      'actionDate': instance.actionDate,
      'requestStatus': instance.requestStatus,
      'requestID': instance.requestID,
    };
