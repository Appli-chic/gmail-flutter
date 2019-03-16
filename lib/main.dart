import 'package:flutter/material.dart';
import 'package:gmail/component/mail-item.dart';

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
        height: double.infinity,
        child: SingleChildScrollView(
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
                              style: TextStyle(
                                  color: Colors.white, fontSize: 11.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(20.0),
                children: <Widget>[
                  Text('PRIMARY'),
                  MailItem(
                    circleColor: Colors.red.shade400,
                    title: "Openbook",
                    date: "12:12",
                    object: "Openbook Waitlist: Please Confirm Beta Access Waitlist",
                    message: "Hi there, We received a request to add this email to our beta access waitlist.",
                  ),
                  MailItem(
                    circleColor: Colors.green.shade400,
                    title: "Kickstarter",
                    date: "11:59",
                    object: "Actu de projet no. 10 : Openbook | Privacy-friendly, fun & honest",
                    message: "Hey there, We hope you're having a great start of the weekend.",
                  ),
                  MailItem(
                    circleColor: Colors.yellowAccent.shade700,
                    title: "Firebase",
                    date: "Tue",
                    object: "[Firebase Newsletter | February, 2019] Dynamic audiences",
                    message: "Dynamic Audiences in Google Analytics for Firebase",
                  ),
                  MailItem(
                    circleColor: Colors.blueAccent.shade400,
                    title: "Facebook",
                    date: "7 Mar",
                    object: "Facebook Legacy Settings Change",
                    message: "Hi Guillaume, The choice to have your account",
                  ),
                  MailItem(
                    circleColor: Colors.brown.shade400,
                    title: "Google Cloud Platform",
                    date: "4 Mar",
                    object: "Product updates | March 4, 2019",
                    message: "A regular roundup of what's new accross Google Cloud Platform",
                  ),
                  MailItem(
                    circleColor: Colors.black54,
                    title: "Medium Partner Program",
                    date: "3 Mar",
                    object: "You've published your first Partner Program story",
                    message: "Guillaume Belouin You've published a story as part",
                  ),
                  MailItem(
                    circleColor: Colors.red.shade500,
                    title: "Indeed",
                    date: "3 Mar",
                    object: "15 Work From Home Jobs That Pay Well",
                    message: "Interested in remote work? We've compiled the best",
                  ),
                  MailItem(
                    circleColor: Colors.black87,
                    title: "Apple Developer",
                    date: "3 Mar",
                    object: "Apple Worldwide Developers Conference 2019",
                    message: "This is not an invitation. It's a challenge. This is",
                  ),
                  MailItem(
                    circleColor: Colors.purple.shade300,
                    title: "GitKraken",
                    date: "3 Mar",
                    object: "Life's Too short for the Command Line",
                    message: "No one is giving out 'Git Nerd merit badges' for misguided.",
                  ),
                  MailItem(
                    circleColor: Colors.cyan.shade300,
                    title: "Mike Hartington",
                    date: "3 Mar",
                    object: "Tutorials & Guides from the Ionic Community",
                    message: "Hey Guillaume, here's the most popular content from the Ionic community.",
                  ),
                  MailItem(
                    circleColor: Colors.red.shade300,
                    title: "Heroku",
                    date: "3 Mar",
                    object: "Heroku in 2019: Advancing Developer Experiences",
                    message: "In an AWS VPC. Auto Cert Management, More than",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
