import 'package:flutter/material.dart';
import 'package:gmail/component/drawer-item.dart';

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
          DrawerItem(
            leadingIcon: Icons.inbox,
            text: 'Primary',
            defaultSelected: true,
            onTap: () {
//              Navigator.pop(context);
            },
          ),
          DrawerItem(
            leadingIcon: Icons.group,
            text: 'Social',
            isTrailing: true,
            trailingText: '3 new',
            onTap: () {
//              Navigator.pop(context);
            },
          ),
          DrawerItem(
            leadingIcon: Icons.local_offer,
            text: 'Promotions',
            isTrailing: true,
            trailingText: '68 new',
            trailingColor: Colors.green[600],
            onTap: () {
//              Navigator.pop(context);
            },
          ),
          Divider(
            indent: 55,
            height: 1,
          ),
          DrawerItem(
            leadingIcon: Icons.star_border,
            text: 'Starred',
            onTap: () {
//              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
