import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_collector_requests_response.g.dart';
@JsonSerializable()
class GetCollectorRequestsResponse {
  List<RequestData>? result;

  GetCollectorRequestsResponse({
    this.result,
  });
  factory GetCollectorRequestsResponse.fromJson(Map<String, dynamic> json) => _$GetCollectorRequestsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetCollectorRequestsResponseToJson(this);

}
@JsonSerializable()
class RequestData {
  String? phoneNo;
  String? name;
  int? balance;
  String? relatedTo;
  String? oldValue;
  String? requestType;
  String? newValue;
  String? requestDate;
  String? actionDate;
  String? requestStatus;
  int? requestID;

  RequestData({
    this.phoneNo,
    this.name,
    this.balance,
    this.relatedTo,
    this.oldValue,
    this.requestType,
    this.newValue,
    this.requestDate,
    this.actionDate,
    this.requestStatus,
    this.requestID,
  });
  factory RequestData.fromJson(Map<String, dynamic> json) => _$RequestDataFromJson(json);
  Map<String, dynamic> toJson() => _$RequestDataToJson(this);

}