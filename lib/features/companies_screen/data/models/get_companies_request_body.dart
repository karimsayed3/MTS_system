import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_companies_request_body.g.dart';
@JsonSerializable()
class GetCompaniesRequestBody{

  String? companyName;

  GetCompaniesRequestBody({
    this.companyName
  });

  Map<String, dynamic> toJson() => _$GetCompaniesRequestBodyToJson(this);

  fromJson(Map<String, dynamic> json) => _$GetCompaniesRequestBodyFromJson(json);

}