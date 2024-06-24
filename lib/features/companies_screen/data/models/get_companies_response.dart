import 'package:json_annotation/json_annotation.dart';
part 'get_companies_response.g.dart';
@JsonSerializable()
class GetCompaniesResponse {
  @JsonKey(name: 'result')
  List<CompanyData>? companies;
  GetCompaniesResponse({
    this.companies,
  });

  factory GetCompaniesResponse.fromJson(Map<String, dynamic> json) => _$GetCompaniesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetCompaniesResponseToJson(this);

}
class CompanyData {
  int? companyID;
  String? name;
  String? registrationDate;
  int? subscribersCount;

  CompanyData(
      {this.companyID,
        this.name,
        this.registrationDate,
        this.subscribersCount});

  CompanyData.fromJson(Map<String, dynamic> json) {
    companyID = json['companyID'];
    name = json['name'];
    registrationDate = json['registrationDate'];
    subscribersCount = json['subscribersCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyID'] = this.companyID;
    data['name'] = this.name;
    data['registrationDate'] = this.registrationDate;
    data['subscribersCount'] = this.subscribersCount;
    return data;
  }
}