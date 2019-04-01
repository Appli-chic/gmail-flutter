import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gmail/screen/login-screen.dart';
import 'package:gmail/screen/main-screen.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light
    ));

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (_) {
          return MainScreen();
        },
        '/login': (_) {
          return LoginScreen();
        },
      },
      title: 'Gmail',
    );
  }
}
