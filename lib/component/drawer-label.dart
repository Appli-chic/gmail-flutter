import 'package:flutter/material.dart';

class DrawerLabel extends StatelessWidget {
  DrawerLabel({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6, top: 4),
      padding: EdgeInsets.only(left: 14, top: 14, bottom: 8),
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
