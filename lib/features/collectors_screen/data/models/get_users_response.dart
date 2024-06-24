import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_users_response.g.dart';
@JsonSerializable()
class GetUsersResponse{
  @JsonKey(name: "result")
  List<UserData>? users;
  GetUsersResponse({this.users});
  factory GetUsersResponse.fromJson(Map<String, dynamic> json) => _$GetUsersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetUsersResponseToJson(this);
}
@JsonSerializable()
class UserData{
  String? name;
  String? email;
  int? collectorBalance;
  int? cashCollected;
  int? walletCollected;
  int? totalCollected;
  int? userID;
  String? accountType;

  UserData({
    this.name,
    this.email,
    this.collectorBalance,
    this.cashCollected,
    this.walletCollected,
    this.totalCollected,
    this.userID,
    this.accountType
  });
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

}