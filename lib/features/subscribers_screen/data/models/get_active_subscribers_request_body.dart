import 'package:json_annotation/json_annotation.dart';
part 'get_active_subscribers_request_body.g.dart';
@JsonSerializable()
class GetActiveSubscribersRequestBody {
  String? phone;
  String? name;
  String? relatedTo;
  String? planName;
  String? lineType;
  String? companyName;
  String? collectorName;

  GetActiveSubscribersRequestBody(
      {this.phone, this.name,this.collectorName,this.companyName, this.relatedTo, this.planName, this.lineType});

  factory GetActiveSubscribersRequestBody.fromJson(Map<String, dynamic> json) => _$GetActiveSubscribersRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GetActiveSubscribersRequestBodyToJson(this);
}
