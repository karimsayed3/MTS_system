import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_disabled_subscribers_response.g.dart';
@JsonSerializable()
class GetDisabledSubscribersResponse {
  List<DisabledSubscriberData>? result;
  GetDisabledSubscribersResponse({required this.result});
  factory GetDisabledSubscribersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDisabledSubscribersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetDisabledSubscribersResponseToJson(this);
}


@JsonSerializable()
class DisabledSubscriberData {
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
  DisabledSubscriberData(
      {this.phoneNo, this.name, this.relatedTo, this.lineType, this.collectorName, this.companyName, this.planName, this.balance, this.registrationDate, this.lastPositiveDepoit, this.actionDate});
  factory DisabledSubscriberData.fromJson(Map<String, dynamic> json) =>
      _$DisabledSubscriberDataFromJson(json);
  Map<String, dynamic> toJson() => _$DisabledSubscriberDataToJson(this);
}