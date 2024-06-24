class TokenDecode {
  String? accountType;
  int? userID;
  String? username;
  int? iat;

  TokenDecode({this.accountType, this.userID, this.username, this.iat});

  TokenDecode.fromJson(Map<String, dynamic> json) {
    accountType = json['accountType'];
    userID = json['userID'];
    username = json['username'];
    iat = json['iat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountType'] = this.accountType;
    data['userID'] = this.userID;
    data['username'] = this.username;
    data['iat'] = this.iat;
    return data;
  }
}
