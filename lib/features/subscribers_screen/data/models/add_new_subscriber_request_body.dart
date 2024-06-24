import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_new_subscriber_request_body.g.dart';
@JsonSerializable()
class AddNewSubscriberRequestBody {
  String? phone;
  String? name;
  @JsonKey(name: 'NID')
  String? nID;
  String? email;
  String? address;
  String? relatedTo;
  String? collectorEmail;
  String? companyName;
  String? planName;
  String? lineType;
  String? offer;
  int? balance;

  AddNewSubscriberRequestBody(
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
        this.offer,
        this.balance});

  factory AddNewSubscriberRequestBody.fromJson(Map<String, dynamic> json) => _$AddNewSubscriberRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$AddNewSubscriberRequestBodyToJson(this);

}
