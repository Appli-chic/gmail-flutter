import 'package:flutter/material.dart';
import 'package:gmail/component/floating-search-bar.dart';
import 'package:gmail/component/gmail-drawer.dart';
import 'package:gmail/component/mail-item.dart';
import 'package:gmail/model/email-summary.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_color_avatar/flutter_color_avatar.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

var listEmails = [
  EmailSummary(
    "Openbook",
    DateTime.now(),
    "Openbook Waitlist: Please Confirm Beta Access Waitlist",
    "Hey there, We hope you're having a great start of the weekend.",
  ),
];

class _MyHomePageState extends State<MyHomePage> {
  int _itemSelected = 1;

  _onSelectItem(int index) {
    setState(() => _itemSelected = index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gmail',
      home: FloatingSearchBar(
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
            final difference = now.difference(listEmails[index - 1].date.toLocal());

            return MailItem(
              circleColor: ColorAvatar.getColorFromName(listEmails[index - 1].title),
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
      ),
    );
  }
}
