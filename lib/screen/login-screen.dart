import 'dart:async';

import 'package:gmail/service/auth-services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _flutterWebviewPlugin = new FlutterWebviewPlugin();

  // On urlChanged stream
  StreamSubscription<String> _onUrlChanged;

  @override
  void initState() {
    super.initState();

    // Add a listener to on url changed
    _onUrlChanged = _flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        if (url.startsWith('https://accounts.google.com/o/oauth2/approval/')) {
          this._flutterWebviewPlugin.hide();
          AuthServices.retrieveGoogleCode(url).then((_) {
            this._flutterWebviewPlugin.close();
          }).catchError((err) {

          });
        }
      }
    });
  }

  @override
  void dispose() {
    this._onUrlChanged.cancel();
    this._flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: AuthServices.getGoogleOpenIdUrl(),
      appBar: AppBar(
        title: Text(
          'Connect to Gmail',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: false,
      initialChild: Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
      ),
    );
  }
}
