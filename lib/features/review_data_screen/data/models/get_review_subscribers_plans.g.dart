// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_review_subscribers_plans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReviewSubscribersPlans _$GetReviewSubscribersPlansFromJson(
        Map<String, dynamic> json) =>
    GetReviewSubscribersPlans(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ReviewSubscriberData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetReviewSubscribersPlansToJson(
        GetReviewSubscribersPlans instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ReviewSubscriberData _$ReviewSubscriberDataFromJson(
        Map<String, dynamic> json) =>
    ReviewSubscriberData(
      phoneNo: json['phoneNo'] as String?,
      name: json['name'] as String?,
      notes: json['notes'] as String?,
      companyPlanName: json['companyPlanName'] as String?,
      systemPlanName: json['systemPlanName'] as String?,
    );

Map<String, dynamic> _$ReviewSubscriberDataToJson(
        ReviewSubscriberData instance) =>
    <String, dynamic>{
      'phoneNo': instance.phoneNo,
      'name': instance.name,
      'companyPlanName': instance.companyPlanName,
      'systemPlanName': instance.systemPlanName,
      'notes': instance.notes,
    };
