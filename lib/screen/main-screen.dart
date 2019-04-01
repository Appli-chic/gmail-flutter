import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gmail/component/floating-search-bar.dart';
import 'package:gmail/component/gmail-drawer.dart';
import 'package:gmail/component/mail-item.dart';
import 'package:gmail/model/email-summary.dart';
import 'package:gmail/model/user.dart';
import 'package:gmail/service/email-services.dart';
import 'package:gmail/utils/constants.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_color_avatar/flutter_color_avatar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

var listEmails = [
  EmailSummary(
    "1",
    "Openbook",
    DateTime.now(),
    "Openbook Waitlist: Please Confirm Beta Access Waitlist",
    "Hey there, We hope you're having a great start of the weekend.",
  ),
];

class _MainScreenState extends State<MainScreen> {
  int _itemSelected = 1;

  EmailServices _emailServices;

  _onSelectItem(int index) {
    setState(() => _itemSelected = index);
  }

  @override
  void initState() {
    super.initState();

    this._emailServices = EmailServices();
    this._getEmails();
  }

  _getEmails() async {
    final storage = new FlutterSecureStorage();
    String value = await storage.read(key: USER_KEY);

    if(value != null && value != "") {
      User user = User.decodeJson(json.decode(value));

      this._emailServices.getInboxEmails(user.accessToken, 20).then((emails) {
        listEmails = emails;
        this.setState((){});
      }).catchError((err) {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      itemCount: listEmails.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Container(
            padding: EdgeInsets.only(top: 12, left: 12),
            child: Text(
              'PRIMARY',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        } else {
          final now = new DateTime.now();
          final difference =
          now.difference(listEmails[index - 1].date.toLocal());

          return MailItem(
            circleColor:
            ColorAvatar.getColorFromName(listEmails[index - 1].title),
            title: listEmails[index - 1].title,
            date: timeago.format(now.subtract(difference)),
            object: listEmails[index - 1].object,
            message: listEmails[index - 1].message,
          );
        }
      },
      drawer: GmailDrawer(
        itemSelected: this._itemSelected,
        onSelectItem: this._onSelectItem,
      ),
    );
  }
}
