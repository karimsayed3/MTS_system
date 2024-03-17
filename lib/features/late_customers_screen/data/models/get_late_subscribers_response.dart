import 'package:json_annotation/json_annotation.dart';

part 'get_late_subscribers_response.g.dart';

@JsonSerializable()
class GetLateSubscribersResponse {
  List<LateSubscriberData>? result;

  GetLateSubscribersResponse({this.result});

  factory GetLateSubscribersResponse.fromJson(Map<String, dynamic> json) => _$GetLateSubscribersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetLateSubscribersResponseToJson(this);

}
@JsonSerializable()
class LateSubscriberData {
  String? phoneNo;
  String? name;
  int? balance;
  String? relatedTo;
  String? collectorName;
  String? planName;
  String? registrationDate;
  int? monthsLate;

  LateSubscriberData({
    this.phoneNo,
    this.name,
    this.balance,
    this.relatedTo,
    this.collectorName,
    this.planName,
    this.registrationDate,
    this.monthsLate,
  });

  factory LateSubscriberData.fromJson(Map<String, dynamic> json) => _$LateSubscriberDataFromJson(json);
  Map<String, dynamic> toJson() => _$LateSubscriberDataToJson(this);

}