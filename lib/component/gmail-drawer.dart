import 'package:flutter/material.dart';

class GmailDrawer extends StatefulWidget {
  GmailDrawer({
    Key key,
  }) : super(key: key);

  @override
  _GmailDrawerState createState() => _GmailDrawerState();
}

class _GmailDrawerState extends State<GmailDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: 16,
              top: 8,
              bottom: 8,
            ),
            child: Text(
              "Gmail",
              style: TextStyle(
                color: Colors.red[700],
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.inbox),
            title: Text('Primary'),
            onTap: () {
              // change app state...
              Navigator.pop(context); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Social'),
            trailing: Container(
              padding: EdgeInsets.only(
                top: 4,
                bottom: 4,
                left: 9,
                right: 9,
              ),
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Text(
                "3 new",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
            ),
            onTap: () {
              // change app state...
              Navigator.pop(context); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.local_offer),
            title: Text('Promotions'),
            onTap: () {
              // change app state...
              Navigator.pop(context); // close the drawer
            },
          ),
          Divider(
            indent: 70,
          ),
          ListTile(
            leading: Icon(Icons.star_border),
            title: Text('Starred'),
            onTap: () {
              // change app state...
              Navigator.pop(context); // close the drawer
            },
          ),
        ],
      ),
    );
  }
}