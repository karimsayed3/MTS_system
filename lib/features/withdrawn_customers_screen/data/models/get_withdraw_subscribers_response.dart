
import 'package:json_annotation/json_annotation.dart';

part 'get_withdraw_subscribers_response.g.dart';
@JsonSerializable()
class GetWithdrawnSubscribersResponse {
  List<WithdrawnSubscriberData>? result;
  GetWithdrawnSubscribersResponse({required this.result});
  factory GetWithdrawnSubscribersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWithdrawnSubscribersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetWithdrawnSubscribersResponseToJson(this);
}

@JsonSerializable()
class WithdrawnSubscriberData {
  String? phoneNo;
  String? name;
  int? balance;
  String? relatedTo;
  String? collectorName;
  String? companyName;
  String? planName;
  String? lineType;
  String? registrationDate;
  int? lastPositiveDepoit;
  String? actionDate;
  WithdrawnSubscriberData(
      {this.phoneNo, this.name, this.relatedTo, this.lineType, this.collectorName, this.companyName, this.planName, this.balance, this.registrationDate, this.lastPositiveDepoit, this.actionDate});
  factory WithdrawnSubscriberData.fromJson(Map<String, dynamic> json) =>
      _$WithdrawnSubscriberDataFromJson(json);
  Map<String, dynamic> toJson() => _$WithdrawnSubscriberDataToJson(this);
}