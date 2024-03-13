
import 'package:json_annotation/json_annotation.dart';
part 'get_disabled_subscribers_request_body.g.dart';
@JsonSerializable()
class GetDisabledSubscribersRequestBody {
  String? phone;
  String? name;
  String? relatedTo;
  String? lineType;
  String? collectorName;
  String? companyName;
  String? planName;

  GetDisabledSubscribersRequestBody(
      {this.phone,
        this.name,
        this.relatedTo,
        this.lineType,
        this.collectorName,
        this.companyName,
        this.planName});

  factory GetDisabledSubscribersRequestBody.fromJson(Map<String, dynamic> json) => _$GetDisabledSubscribersRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GetDisabledSubscribersRequestBodyToJson(this);

}
