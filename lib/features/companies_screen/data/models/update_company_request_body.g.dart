// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_company_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCompanyRequestBody _$UpdateCompanyRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateCompanyRequestBody(
      companyName: json['companyName'] as String?,
      companyID: json['companyID'] as int?,
    );

Map<String, dynamic> _$UpdateCompanyRequestBodyToJson(
        UpdateCompanyRequestBody instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'companyID': instance.companyID,
    };
