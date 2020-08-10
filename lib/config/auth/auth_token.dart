class AuthToken {
  String accessToken;
  String tokenType;
  String refreshToken;
  int expiresIn;

  AuthToken({this.accessToken, this.tokenType, this.refreshToken, this.expiresIn});

  AuthToken.fromMap(dynamic object) {
    this.accessToken = object["access_token"];
    this.tokenType = object["token_type"];
    this.refreshToken = object["refresh_token"];
    this.expiresIn = object["expires_in"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["access_token"] = this.accessToken;
    map["token_type"] = this.tokenType;
    map["refresh_token"] = this.refreshToken;
    map["expires_in"] = this.expiresIn;
    return map;
  }

  String toString() {
    return "TokenMdelResponse = " + toMap().toString();
  }
}

class AuthResult {
  bool success = false;
  String redirectPath;
  
  AuthResult({this.success, this.redirectPath});
}