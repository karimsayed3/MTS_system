// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_subscriber_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewSubscriberRequestBody _$AddNewSubscriberRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AddNewSubscriberRequestBody(
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      nID: json['nID'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      relatedTo: json['relatedTo'] as String?,
      collectorEmail: json['collectorEmail'] as String?,
      companyName: json['companyName'] as String?,
      planName: json['planName'] as String?,
      lineType: json['lineType'] as String?,
      offer: json['offer'] as String?,
      balance: json['balance'] as int?,
    );

Map<String, dynamic> _$AddNewSubscriberRequestBodyToJson(
        AddNewSubscriberRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'name': instance.name,
      'nID': instance.nID,
      'email': instance.email,
      'address': instance.address,
      'relatedTo': instance.relatedTo,
      'collectorEmail': instance.collectorEmail,
      'companyName': instance.companyName,
      'planName': instance.planName,
      'lineType': instance.lineType,
      'offer': instance.offer,
      'balance': instance.balance,
    };
