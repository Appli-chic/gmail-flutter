import 'dart:async';

import 'package:gmail/service/auth-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:gmail/utils/secure-storage-manager.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _flutterWebViewPlugin = new FlutterWebviewPlugin();
  AuthService _authService;
  bool _isAuthServiceLoaded;

  // On urlChanged stream
  StreamSubscription<String> _onUrlChanged;

  @override
  void initState() {
    super.initState();

    this._isAuthServiceLoaded = false;
    this._loadAuthService();

    // Add a listener to on url changed
    _onUrlChanged = _flutterWebViewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        if (url.startsWith('https://accounts.google.com/o/oauth2/approval/')) {
          this._flutterWebViewPlugin.hide();
          _authService.retrieveGoogleCode(url).then((_) {
            this._flutterWebViewPlugin.close();
            Navigator.pop(context);
          }).catchError((err) {
            this._flutterWebViewPlugin.close();
            Navigator.pop(context);
          });
        }
      }
    });
  }

  _loadAuthService() async {
    this._authService = await SecureStorageManager.loadAuthService();

    this.setState(() {
      _isAuthServiceLoaded = true;
    });
  }

  @override
  void dispose() {
    this._onUrlChanged.cancel();
    this._flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (this._isAuthServiceLoaded) {
      return WebviewScaffold(
        url: _authService.getGoogleOpenIdUrl(),
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
    } else {
      return Container();
    }
  }
}
