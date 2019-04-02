
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gmail/model/user.dart';
import 'package:gmail/service/auth-service.dart';
import 'package:gmail/utils/constants.dart';
import 'package:gmail/utils/environment.dart';

class SecureStorageManager {

  static Future<AuthService> loadAuthService() async {
    Environment environment =
    await EnvironmentLoader(environmentPath: ".env.json").load();

    AuthService authService = AuthService();
    authService.setOauth2Info(environment.googleClientId,
        environment.googleClientSecret, environment.googleRedirectUri);

    return authService;
  }

  static Future<User> retrieveUser() async {
    final storage = new FlutterSecureStorage();
    String value = await storage.read(key: USER_KEY);

    if (value != null && value != "") {
      return User.decodeJson(json.decode(value));
    } else {
      throw("error");
    }
  }
}