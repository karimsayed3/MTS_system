import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_collector_requests_request_body.g.dart';
@JsonSerializable()
class GetCollectorRequestsRequestBody {
  String? fromDate;
  String? toDate;
  String? requestTypes;

  GetCollectorRequestsRequestBody({this.fromDate, this.toDate, this.requestTypes});
  factory GetCollectorRequestsRequestBody.fromJson(Map<String, dynamic> json) => _$GetCollectorRequestsRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$GetCollectorRequestsRequestBodyToJson(this);

}