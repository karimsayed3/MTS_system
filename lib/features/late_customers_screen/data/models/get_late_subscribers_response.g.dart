// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_late_subscribers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLateSubscribersResponse _$GetLateSubscribersResponseFromJson(
        Map<String, dynamic> json) =>
    GetLateSubscribersResponse(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => LateSubscriberData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetLateSubscribersResponseToJson(
        GetLateSubscribersResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

LateSubscriberData _$LateSubscriberDataFromJson(Map<String, dynamic> json) =>
    LateSubscriberData(
      phoneNo: json['phoneNo'] as String?,
      name: json['name'] as String?,
      balance: json['balance'] as int?,
      relatedTo: json['relatedTo'] as String?,
      collectorName: json['collectorName'] as String?,
      planName: json['planName'] as String?,
      registrationDate: json['registrationDate'] as String?,
      monthsLate: json['monthsLate'] as int?,
    );

Map<String, dynamic> _$LateSubscriberDataToJson(LateSubscriberData instance) =>
    <String, dynamic>{
      'phoneNo': instance.phoneNo,
      'name': instance.name,
      'balance': instance.balance,
      'relatedTo': instance.relatedTo,
      'collectorName': instance.collectorName,
      'planName': instance.planName,
      'registrationDate': instance.registrationDate,
      'monthsLate': instance.monthsLate,
    };
