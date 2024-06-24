import 'package:freezed_annotation/freezed_annotation.dart';
part 'undo_plan_from_subscribers_request_body.g.dart';
@JsonSerializable()
class UndoPlanFromSubscribersRequestBody {

  int? companyID;

  UndoPlanFromSubscribersRequestBody({
    this.companyID,
  });

  Map<String, dynamic> toJson() => _$UndoPlanFromSubscribersRequestBodyToJson(this);

  fromJson(Map<String, dynamic> json) => _$UndoPlanFromSubscribersRequestBodyFromJson(json);

}