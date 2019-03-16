import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.only(
                bottom: 8.0,
                right: 8.0,
                left: 8.0,
                top: kToolbarHeight,
              ),
              color: Colors.white,
              elevation: 2.0,
              child: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.menu,
                          color: Colors.black54,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Search email",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 4.0),
                        child: CircleAvatar(
                          maxRadius: 14,
                          backgroundColor: Colors.red.shade500,
                          child: Text(
                            'AP',
                            style:
                                TextStyle(color: Colors.white, fontSize: 11.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
