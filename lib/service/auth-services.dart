import 'dart:async';
import 'dart:convert';

import 'package:gmail/model/user.dart';
import 'package:gmail/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthServices {

  static String getGoogleOpenIdUrl() {
    return 'https://accounts.google.com/o/oauth2/auth'
        '?client_id=664946562935-362c6eue365154ldboln3t960d2tstff.apps.googleusercontent.com'
        '&response_type=code'
        '&scope=openid%20profile%20email%20https://www.googleapis.com/auth/gmail.compose%20'
        'https://mail.google.com/%20https://www.googleapis.com/auth/gmail.modify%20'
        'https://www.googleapis.com/auth/gmail.readonly'
        '&redirect_uri=urn:ietf:wg:oauth:2.0:oob';
  }

  static Future<void> retrieveGoogleCode(String url) async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var document = parse(response.body);
      var element = document.body.getElementsByClassName("qBHUIf");
      await AuthServices.connectToGoogleService(element.elementAt(0).text);
      return;
    } else {
      throw Exception('Error');
    }
  }

  static Future<void> connectToGoogleService(String code) async {

    var queryParameters = {
      'code': code,
      'client_id': '664946562935-362c6eue365154ldboln3t960d2tstff.apps.googleusercontent.com',
      'client_secret': 'IAT6f1CV5UxZcoalcbySOFqd',
      'redirect_uri': 'urn:ietf:wg:oauth:2.0:oob',
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

      AuthServices.profileGoogle(accessToken).then((body) async {
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

  static Future<String> profileGoogle(String accessToken) async {
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
}