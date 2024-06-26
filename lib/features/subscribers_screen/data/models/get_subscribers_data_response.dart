class GetSubscribersDataResponse {
  List<SubscriberData>? result;

  GetSubscribersDataResponse({this.result});

  GetSubscribersDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <SubscriberData>[];
      json['result'].forEach((v) {
        result!.add(new SubscriberData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubscriberData {
  String? phoneNo;
  String? name;
  String? NID;
  int? balance;
  String? relatedTo;
  String? collectorName;
  String? companyName;
  String? planName;
  String? lineType;
  String? registrationDate;
  String? offer;
  String? address;
  int? lastPositiveDepoit;

  SubscriberData(
      {this.phoneNo,
        this.name,
        this.NID,
        this.balance,
        this.relatedTo,
        this.collectorName,
        this.companyName,
        this.planName,
        this.lineType,
        this.registrationDate,
        this.offer,
        this.address,
        this.lastPositiveDepoit});

  SubscriberData.fromJson(Map<String, dynamic> json) {
    phoneNo = json['phoneNo'];
    name = json['name'];
    balance = json['balance'];
    relatedTo = json['relatedTo'];
    NID = json['NID'];
    collectorName = json['collectorName'];
    companyName = json['companyName'];
    planName = json['planName'];
    lineType = json['lineType'];
    registrationDate = json['registrationDate'];
    offer = json['offer'];
    address = json['address'];
    lastPositiveDepoit = json['lastPositiveDepoit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNo'] = this.phoneNo;
    data['name'] = this.name;
    data['NID'] = this.NID;
    data['balance'] = this.balance;
    data['relatedTo'] = this.relatedTo;
    data['collectorName'] = this.collectorName;
    data['companyName'] = this.companyName;
    data['planName'] = this.planName;
    data['lineType'] = this.lineType;
    data['registrationDate'] = this.registrationDate;
    data['offer'] = this.offer;
    data['lastPositiveDepoit'] = this.lastPositiveDepoit;
    data['address'] = this.address;
    return data;
  }
}
