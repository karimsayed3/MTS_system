import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_company_request_body.g.dart';
@JsonSerializable()
class DeleteCompanyRequestBody {
  int? companyID;

  DeleteCompanyRequestBody({
    this.companyID
  });

  Map<String, dynamic> toJson() => _$DeleteCompanyRequestBodyToJson(this);
  fromJson(Map<String, dynamic> json) => _$DeleteCompanyRequestBodyFromJson(json);
}