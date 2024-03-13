import 'package:json_annotation/json_annotation.dart';
part 'get_withdrawn_subscribers_request_body.g.dart';
@JsonSerializable()
class GetWithdrawnSubscribersRequestBody {
  String? phone;
  String? name;
  String? relatedTo;
  String? lineType;
  String? collectorName;
  String? companyName;
  String? planName;

  GetWithdrawnSubscribersRequestBody(
      {this.phone,
        this.name,
        this.relatedTo,
        this.lineType,
        this.collectorName,
        this.companyName,
        this.planName});

  factory GetWithdrawnSubscribersRequestBody.fromJson(Map<String, dynamic> json) => _$GetWithdrawnSubscribersRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GetWithdrawnSubscribersRequestBodyToJson(this);
}
