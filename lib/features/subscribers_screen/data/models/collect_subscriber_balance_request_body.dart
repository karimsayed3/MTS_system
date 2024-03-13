import 'package:json_annotation/json_annotation.dart';

part 'collect_subscriber_balance_request_body.g.dart';
@JsonSerializable()
class CollectSubscriberBalanceRequestBody {
  String? phone;
  String? collectingType;
  int? amount;

  CollectSubscriberBalanceRequestBody(
      {this.phone, this.collectingType, this.amount});

  factory CollectSubscriberBalanceRequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$CollectSubscriberBalanceRequestBodyFromJson(json);
  Map<String, dynamic> toJson() =>
      _$CollectSubscriberBalanceRequestBodyToJson(this);


}
