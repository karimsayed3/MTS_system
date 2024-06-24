class ResultsOfUploadedExcelModel {
  List<Results>? results;

  ResultsOfUploadedExcelModel({this.results});

  ResultsOfUploadedExcelModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? statusMessage;

  Results({this.statusMessage});

  Results.fromJson(Map<String, dynamic> json) {
    statusMessage = json['statusMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusMessage'] = this.statusMessage;
    return data;
  }
}
