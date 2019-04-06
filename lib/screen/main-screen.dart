import 'package:flutter/material.dart';
import 'package:gmail/component/floating-search-bar.dart';
import 'package:gmail/component/gmail-drawer.dart';
import 'package:gmail/component/mail-item.dart';
import 'package:gmail/model/email.dart';
import 'package:gmail/model/user.dart';
import 'package:gmail/screen/login-screen.dart';
import 'package:gmail/service/auth-service.dart';
import 'package:gmail/service/email-service.dart';
import 'package:gmail/utils/secure-storage-manager.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

var listEmails = [
  Email(
    "1",
    "Openbook",
    DateTime.now(),
    "Openbook Waitlist: Please Confirm Beta Access Waitlist",
    "Hey there, We hope you're having a great start of the weekend.",
    false,
    [],
  ),
];

class _MainScreenState extends State<MainScreen> {
  int _itemSelected = 1;

  EmailService _emailService;
  AuthService _authService;

  _onSelectItem(int index) {
    setState(() => _itemSelected = index);
  }

  @override
  void initState() {
    super.initState();

    this._emailService = EmailService();
    this._getEmails();
  }

  _getEmails() async {
    // TODO: Add linked files in the email preview list
    // TODO: Better manage the errors in general
    // TODO: Check if there is no user
    // Refresh the access token
    User user = await SecureStorageManager.retrieveUser();

    if (user == null) {
      await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (_) => false,
      );

      user = await SecureStorageManager.retrieveUser();
    }

    this._authService = await SecureStorageManager.loadAuthService();
    String accessToken =
        await this._authService.refreshGoogleToken(user.refreshToken);

    // Retrieve the emails.
    this._emailService.getInboxEmails(accessToken, 20).then((emails) {
      listEmails = emails;
      this.setState(() {});
    }).catchError((err) {});
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
          return MailItem(
            email: listEmails[index - 1],
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
