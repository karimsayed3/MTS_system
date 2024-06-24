import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_plans_response.g.dart';

@JsonSerializable()
class GetPlansResponse{
  @JsonKey(name: 'result')
  List<PlanData>? plans;

  GetPlansResponse({
    this.plans,
  });

  factory GetPlansResponse.fromJson(Map<String, dynamic> json) => _$GetPlansResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetPlansResponseToJson(this);

}


class PlanData {
  int? planID;
  String? name;
  int? price;
  String? companyName;
  int? subscribersCount;

  PlanData(
      {this.planID,
        this.name,
        this.price,
        this.companyName,
        this.subscribersCount});

  PlanData.fromJson(Map<String, dynamic> json) {
    planID = json['planID'];
    name = json['name'];
    price = json['price'];
    companyName = json['companyName'];
    subscribersCount = json['subscribersCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['planID'] = this.planID;
    data['name'] = this.name;
    data['price'] = this.price;
    data['companyName'] = this.companyName;
    data['subscribersCount'] = this.subscribersCount;
    return data;
  }
}