import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_company_request_body.g.dart';
@JsonSerializable()
class UpdateCompanyRequestBody {
  String? companyName;
  int? companyID;

  UpdateCompanyRequestBody({
    this.companyName,
    this.companyID
  });

  Map<String, dynamic> toJson() => _$UpdateCompanyRequestBodyToJson(this);

  fromJson(Map<String, dynamic> json) => _$UpdateCompanyRequestBodyFromJson(json);

}
