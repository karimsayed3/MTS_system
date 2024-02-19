// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_plans_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPlansResponse _$GetPlansResponseFromJson(Map<String, dynamic> json) =>
    GetPlansResponse(
      plans: (json['result'] as List<dynamic>?)
          ?.map((e) => PlanData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPlansResponseToJson(GetPlansResponse instance) =>
    <String, dynamic>{
      'result': instance.plans,
    };
