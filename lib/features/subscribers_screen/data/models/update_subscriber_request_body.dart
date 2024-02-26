import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_subscriber_request_body.g.dart';
@JsonSerializable()
class UpdateSubscriberRequestBody {
  String? phone;
  String? name;
  String? nID;
  String? email;
  String? address;
  String? relatedTo;
  String? collectorEmail;
  String? companyName;
  String? planName;
  String? lineType;
  String? offer;

  UpdateSubscriberRequestBody(
      {this.phone,
        this.name,
        this.nID,
        this.email,
        this.address,
        this.relatedTo,
        this.collectorEmail,
        this.companyName,
        this.planName,
        this.lineType,
        this.offer});

  factory UpdateSubscriberRequestBody.fromJson(Map<String, dynamic> json) => _$UpdateSubscriberRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateSubscriberRequestBodyToJson(this);

}
