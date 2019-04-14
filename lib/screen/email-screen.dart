import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gmail/model/email.dart';
import 'dart:convert' show utf8;
import 'package:webview_flutter/webview_flutter.dart';

class EmailScreen extends StatefulWidget {
  EmailScreen({Key key, this.email}) : super(key: key);

  final Email email;

  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    var decodedMessage = base64.decode(this.widget.email.message);
    var body = utf8.decode(decodedMessage);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.grey[700]),
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.archive), onPressed: () {}),
          IconButton(icon: Icon(Icons.delete), onPressed: () {}),
          IconButton(icon: Icon(Icons.email), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(
              this.widget.email.object,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(
              child: WebView(
                initialUrl: Uri.dataFromString(body,
                    mimeType: 'text/html',
                    encoding: Encoding.getByName("UTF-8"))
                    .toString(),
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
