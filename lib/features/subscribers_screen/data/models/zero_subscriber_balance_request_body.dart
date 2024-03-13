import 'package:json_annotation/json_annotation.dart';
part 'zero_subscriber_balance_request_body.g.dart';
@JsonSerializable()
class ZeroSubscriberBalanceRequestBody {
  String? phone;
  String? collectingType;

  ZeroSubscriberBalanceRequestBody({this.phone, this.collectingType});

  factory ZeroSubscriberBalanceRequestBody.fromJson(Map<String, dynamic> json) => _$ZeroSubscriberBalanceRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$ZeroSubscriberBalanceRequestBodyToJson(this);
  
}
