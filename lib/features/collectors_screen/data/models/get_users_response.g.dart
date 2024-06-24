// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersResponse _$GetUsersResponseFromJson(Map<String, dynamic> json) =>
    GetUsersResponse(
      users: (json['result'] as List<dynamic>?)
          ?.map((e) => UserData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUsersResponseToJson(GetUsersResponse instance) =>
    <String, dynamic>{
      'result': instance.users,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      name: json['name'] as String?,
      email: json['email'] as String?,
      collectorBalance: json['collectorBalance'] as int?,
      cashCollected: json['cashCollected'] as int?,
      walletCollected: json['walletCollected'] as int?,
      totalCollected: json['totalCollected'] as int?,
      userID: json['userID'] as int?,
      accountType: json['accountType'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'collectorBalance': instance.collectorBalance,
      'cashCollected': instance.cashCollected,
      'walletCollected': instance.walletCollected,
      'totalCollected': instance.totalCollected,
      'userID': instance.userID,
      'accountType': instance.accountType,
    };
