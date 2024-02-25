import 'package:freezed_annotation/freezed_annotation.dart';
part 'zero_collector_total_request_body.g.dart';
@JsonSerializable()
class ZeroCollectorTotalRequestBody {

  int? userID;

  ZeroCollectorTotalRequestBody({this.userID});

  factory ZeroCollectorTotalRequestBody.fromJson(Map<String, dynamic> json) => _$ZeroCollectorTotalRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$ZeroCollectorTotalRequestBodyToJson(this);

}