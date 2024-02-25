import 'package:freezed_annotation/freezed_annotation.dart';
part 'deduct_balance_collector_request_body.g.dart';
@JsonSerializable()
class DeductBalanceCollectorRequestBody {
  int? userID;
  String? collectingType;
  int? collectedAmount;

  DeductBalanceCollectorRequestBody(
      {this.userID, this.collectingType, this.collectedAmount});

  factory DeductBalanceCollectorRequestBody.fromJson(Map<String, dynamic> json) => _$DeductBalanceCollectorRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$DeductBalanceCollectorRequestBodyToJson(this);
}