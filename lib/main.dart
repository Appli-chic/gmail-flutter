import 'package:flutter/material.dart';
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
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (_) => MainScreen(),
        '/login': (_) => LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Gmail',
    );
  }
}
