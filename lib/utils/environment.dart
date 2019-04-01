import 'dart:convert';

import 'package:flutter/services.dart';

class EnvironmentLoader {
  EnvironmentLoader({this.environmentPath});

  final String environmentPath;

  Future<Environment> load() {
    return rootBundle.loadStructuredData<Environment>(this.environmentPath,
        (jsonStr) async {
      final environmentLoader = Environment.fromJson(json.decode(jsonStr));
      return environmentLoader;
    });
  }
}

class Environment {
  final String googleClientId;
  final String googleRedirectUri;
  final String googleClientSecret;

  const Environment({
    this.googleClientId = '',
    this.googleRedirectUri = '',
    this.googleClientSecret = '',
  });

  factory Environment.fromJson(Map<String, dynamic> jsonMap) {
    return new Environment(
      googleClientId: jsonMap["GOOGLE_CLIENT_ID"],
      googleRedirectUri: jsonMap["GOOGLE_REDIRECT_URI"],
      googleClientSecret: jsonMap["GOOGLE_CLIENT_SECRET"],
    );
  }
}
