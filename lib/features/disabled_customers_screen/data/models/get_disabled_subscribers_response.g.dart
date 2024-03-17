// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_disabled_subscribers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDisabledSubscribersResponse _$GetDisabledSubscribersResponseFromJson(
        Map<String, dynamic> json) =>
    GetDisabledSubscribersResponse(
      result: (json['result'] as List<dynamic>?)
          ?.map(
              (e) => DisabledSubscriberData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDisabledSubscribersResponseToJson(
        GetDisabledSubscribersResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

DisabledSubscriberData _$DisabledSubscriberDataFromJson(
        Map<String, dynamic> json) =>
    DisabledSubscriberData(
      phoneNo: json['phoneNo'] as String?,
      name: json['name'] as String?,
      relatedTo: json['relatedTo'] as String?,
      lineType: json['lineType'] as String?,
      collectorName: json['collectorName'] as String?,
      companyName: json['companyName'] as String?,
      planName: json['planName'] as String?,
      balance: json['balance'] as int?,
      registrationDate: json['registrationDate'] as String?,
      lastPositiveDepoit: json['lastPositiveDepoit'] as int?,
      actionDate: json['actionDate'] as String?,
    );

Map<String, dynamic> _$DisabledSubscriberDataToJson(
        DisabledSubscriberData instance) =>
    <String, dynamic>{
      'phoneNo': instance.phoneNo,
      'name': instance.name,
      'balance': instance.balance,
      'relatedTo': instance.relatedTo,
      'collectorName': instance.collectorName,
      'companyName': instance.companyName,
      'planName': instance.planName,
      'lineType': instance.lineType,
      'registrationDate': instance.registrationDate,
      'lastPositiveDepoit': instance.lastPositiveDepoit,
      'actionDate': instance.actionDate,
    };
