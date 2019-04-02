import 'dart:async';
import 'dart:convert';

import 'package:gmail/model/user.dart';
import 'package:gmail/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  String googleClientId;
  String googleRedirectUri;
  String googleClientSecret;

  String getGoogleOpenIdUrl() {
    return 'https://accounts.google.com/o/oauth2/auth'
        '?client_id=$googleClientId'
        '&response_type=code'
        '&scope=openid%20profile%20email%20https://www.googleapis.com/auth/gmail.compose%20'
        'https://mail.google.com/%20https://www.googleapis.com/auth/gmail.modify%20'
        'https://www.googleapis.com/auth/gmail.readonly'
        '&redirect_uri=$googleRedirectUri';
  }

  Future<void> retrieveGoogleCode(String url) async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var document = parse(response.body);
      var element = document.body.getElementsByClassName("qBHUIf");
      await this.connectToGoogleService(element.elementAt(0).text);
      return;
    } else {
      throw Exception('Error');
    }
  }

  Future<void> connectToGoogleService(String code) async {

    var queryParameters = {
      'code': code,
      'client_id': this.googleClientId,
      'client_secret': this.googleClientSecret,
      'redirect_uri': this.googleRedirectUri,
      'grant_type': 'authorization_code',
    };

    var uri = Uri.https('www.googleapis.com', '/oauth2/v4/token', queryParameters);

    final response = await http.post(uri,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        });

    if (response.statusCode == 200) {
      String accessToken = json.decode(response.body)['access_token'];
      String refreshToken = json.decode(response.body)['refresh_token'];

      this.profileGoogle(accessToken).then((body) async {
        final storage = new FlutterSecureStorage();
        String email = json.decode(body)['emailAddress'];
        User user = new User(email, accessToken, refreshToken);
        await storage.write(key: USER_KEY, value: json.encode(user.toJson()));

        return;
      }).catchError((error) {
        print(error);
        throw Exception('Error');
      });
    }
  }

  Future<String> profileGoogle(String accessToken) async {
    final response = await http.get('https://www.googleapis.com/gmail/v1/users/me/profile',
    headers: {
      'Authorization': 'Bearer $accessToken'
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Error');
    }
  }

  Future<String> refreshGoogleToken(String refreshToken) async {
    var queryParameters = {
      'client_id': this.googleClientId,
      'client_secret': this.googleClientSecret,
      'refresh_token': refreshToken,
      'grant_type': 'refresh_token',
    };

    var uri = Uri.https('www.googleapis.com', '/oauth2/v4/token', queryParameters);

    final response = await http.post(uri,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        });

    if (response.statusCode == 200) {
      final storage = new FlutterSecureStorage();
      String accessToken = json.decode(response.body)['access_token'];
      String value = await storage.read(key: USER_KEY);

      if(value != null && value != "") {
        User user = User.decodeJson(json.decode(value));
        user.accessToken = accessToken;
        await storage.write(key: USER_KEY, value: json.encode(user.toJson()));
      }

      return accessToken;
    } else {
      throw Exception('Error');
    }
  }

  setOauth2Info(String googleClientId, String googleClientSecret, String googleRedirectUri) {
    this.googleClientId = googleClientId;
    this.googleRedirectUri = googleRedirectUri;
    this.googleClientSecret = googleClientSecret;
  }
}