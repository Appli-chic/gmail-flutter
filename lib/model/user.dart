class User {
  String email;
  String accessToken;
  String refreshToken;

  User(String email, String accessToken, String refreshToken) {
    this.email = email;
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
  }

  Map toJson() {
    Map map = new Map();
    map["email"] = email;
    map["accessToken"] = accessToken;
    map["refreshToken"] = refreshToken;
    return map;
  }

  static User decodeJson(Map map) {
    return User(map['email'], map['accessToken'], map['refreshToken']);
  }
}