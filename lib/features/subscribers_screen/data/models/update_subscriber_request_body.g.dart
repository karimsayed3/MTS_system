// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_subscriber_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSubscriberRequestBody _$UpdateSubscriberRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateSubscriberRequestBody(
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      nID: json['NID'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      relatedTo: json['relatedTo'] as String?,
      collectorEmail: json['collectorEmail'] as String?,
      companyName: json['companyName'] as String?,
      planName: json['planName'] as String?,
      lineType: json['lineType'] as String?,
      offer: json['offer'] as String?,
    );

Map<String, dynamic> _$UpdateSubscriberRequestBodyToJson(
        UpdateSubscriberRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'name': instance.name,
      'NID': instance.nID,
      'email': instance.email,
      'address': instance.address,
      'relatedTo': instance.relatedTo,
      'collectorEmail': instance.collectorEmail,
      'companyName': instance.companyName,
      'planName': instance.planName,
      'lineType': instance.lineType,
      'offer': instance.offer,
    };
