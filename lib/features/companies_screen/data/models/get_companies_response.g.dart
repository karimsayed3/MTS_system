// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_companies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCompaniesResponse _$GetCompaniesResponseFromJson(
        Map<String, dynamic> json) =>
    GetCompaniesResponse(
      companies: (json['result'] as List<dynamic>?)
          ?.map((e) => CompanyData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCompaniesResponseToJson(
        GetCompaniesResponse instance) =>
    <String, dynamic>{
      'result': instance.companies,
    };
