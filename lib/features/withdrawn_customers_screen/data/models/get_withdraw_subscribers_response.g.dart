// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_withdraw_subscribers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWithdrawnSubscribersResponse _$GetWithdrawnSubscribersResponseFromJson(
        Map<String, dynamic> json) =>
    GetWithdrawnSubscribersResponse(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) =>
              WithdrawnSubscriberData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetWithdrawnSubscribersResponseToJson(
        GetWithdrawnSubscribersResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

WithdrawnSubscriberData _$WithdrawnSubscriberDataFromJson(
        Map<String, dynamic> json) =>
    WithdrawnSubscriberData(
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

Map<String, dynamic> _$WithdrawnSubscriberDataToJson(
        WithdrawnSubscriberData instance) =>
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
