import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_company_request_body.g.dart';
@JsonSerializable()
class AddCompanyRequestBody {
  String? companyName;

  AddCompanyRequestBody({
    this.companyName,
  });

  Map<String, dynamic> toJson() => _$AddCompanyRequestBodyToJson(this);

  fromJson(Map<String, dynamic> json) => _$AddCompanyRequestBodyFromJson(json);

}