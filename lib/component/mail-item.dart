import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

class MailItem extends StatefulWidget {
  MailItem({
    Key key,
    this.title,
    this.date,
    this.object,
    this.message,
    this.circleColor,
  }) : super(key: key);

  final String title;
  final String date;
  final String object;
  final String message;
  final Color circleColor;

  @override
  _MailItemState createState() => _MailItemState();
}

class _MailItemState extends State<MailItem> {
  var _unescape = new HtmlUnescape();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      margin: EdgeInsets.only(top: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            maxRadius: 18,
            backgroundColor: this.widget.circleColor,
            child: Text(
              this._unescape.convert(this.widget.title).toUpperCase().substring(0, 1),
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
              ),
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(right: 16),
                          child: Text(
                            this._unescape.convert(this.widget.title),
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Text(
                        this.widget.date,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                this._unescape.convert(this.widget.object),
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 2),
                              child: Text(
                                this._unescape.convert(this.widget.message),
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 6),
                        child: Icon(
                          Icons.star_border,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
