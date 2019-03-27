import 'package:flutter/material.dart';
import 'package:gmail/component/floating-search-bar.dart';
import 'package:gmail/component/gmail-drawer.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

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
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(index.toString()),
          );
        },
        drawer: GmailDrawer(
          itemSelected: this._itemSelected,
          onSelectItem: this._onSelectItem,
        ),
      ),
    );
  }
}

//ListView(
//shrinkWrap: true,
//padding: EdgeInsets.all(20.0),
//children: <Widget>[
//Text('PRIMARY'),
//MailItem(
//circleColor: Colors.red.shade400,
//title: "Openbook",
//date: "12:12",
//object:
//"Openbook Waitlist: Please Confirm Beta Access Waitlist",
//message:
//"Hi there, We received a request to add this email to our beta access waitlist.",
//),
//MailItem(
//circleColor: Colors.green.shade400,
//title: "Kickstarter",
//date: "11:59",
//object:
//"Actu de projet no. 10 : Openbook | Privacy-friendly, fun & honest",
//message:
//"Hey there, We hope you're having a great start of the weekend.",
//),
//MailItem(
//circleColor: Colors.yellowAccent.shade700,
//title: "Firebase",
//date: "Tue",
//object:
//"[Firebase Newsletter | February, 2019] Dynamic audiences",
//message:
//"Dynamic Audiences in Google Analytics for Firebase",
//),
//MailItem(
//circleColor: Colors.blueAccent.shade400,
//title: "Facebook",
//date: "7 Mar",
//object: "Facebook Legacy Settings Change",
//message: "Hi Guillaume, The choice to have your account",
//),
//MailItem(
//circleColor: Colors.brown.shade400,
//title: "Google Cloud Platform",
//date: "4 Mar",
//object: "Product updates | March 4, 2019",
//message:
//"A regular roundup of what's new accross Google Cloud Platform",
//),
//MailItem(
//circleColor: Colors.black54,
//title: "Medium Partner Program",
//date: "3 Mar",
//object: "You've published your first Partner Program story",
//message:
//"Guillaume Belouin You've published a story as part",
//),
//MailItem(
//circleColor: Colors.red.shade500,
//title: "Indeed",
//date: "3 Mar",
//object: "15 Work From Home Jobs That Pay Well",
//message:
//"Interested in remote work? We've compiled the best",
//),
//MailItem(
//circleColor: Colors.black87,
//title: "Apple Developer",
//date: "3 Mar",
//object: "Apple Worldwide Developers Conference 2019",
//message:
//"This is not an invitation. It's a challenge. This is",
//),
//MailItem(
//circleColor: Colors.purple.shade300,
//title: "GitKraken",
//date: "3 Mar",
//object: "Life's Too short for the Command Line",
//message:
//"No one is giving out 'Git Nerd merit badges' for misguided.",
//),
//MailItem(
//circleColor: Colors.cyan.shade300,
//title: "Mike Hartington",
//date: "3 Mar",
//object: "Tutorials & Guides from the Ionic Community",
//message:
//"Hey Guillaume, here's the most popular content from the Ionic community.",
//),
//MailItem(
//circleColor: Colors.red.shade300,
//title: "Heroku",
//date: "3 Mar",
//object: "Heroku in 2019: Advancing Developer Experiences",
//message: "In an AWS VPC. Auto Cert Management, More than",
//),
//MailItem(
//circleColor: Colors.red.shade300,
//title: "Heroku",
//date: "3 Mar",
//object: "Heroku in 2019: Advancing Developer Experiences",
//message: "In an AWS VPC. Auto Cert Management, More than",
//),
//MailItem(
//circleColor: Colors.red.shade300,
//title: "Heroku",
//date: "3 Mar",
//object: "Heroku in 2019: Advancing Developer Experiences",
//message: "In an AWS VPC. Auto Cert Management, More than",
//),
//MailItem(
//circleColor: Colors.red.shade300,
//title: "Heroku",
//date: "3 Mar",
//object: "Heroku in 2019: Advancing Developer Experiences",
//message: "In an AWS VPC. Auto Cert Management, More than",
//),
//MailItem(
//circleColor: Colors.red.shade300,
//title: "Heroku",
//date: "3 Mar",
//object: "Heroku in 2019: Advancing Developer Experiences",
//message: "In an AWS VPC. Auto Cert Management, More than",
//),
//MailItem(
//circleColor: Colors.red.shade300,
//title: "Heroku",
//date: "3 Mar",
//object: "Heroku in 2019: Advancing Developer Experiences",
//message: "In an AWS VPC. Auto Cert Management, More than",
//),
//],
