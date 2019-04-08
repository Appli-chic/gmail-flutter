import 'package:flutter/material.dart';
import 'package:flutter_color_avatar/flutter_color_avatar.dart';
import 'package:gmail/model/email.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:timeago/timeago.dart' as timeago;

class MailItem extends StatefulWidget {
  MailItem({
    Key key,
    this.email,
  }) : super(key: key);

  final Email email;

  @override
  _MailItemState createState() => _MailItemState();
}

class _MailItemState extends State<MailItem> {
  var _unescape = new HtmlUnescape();

  _displayFiles() {
    if (this.widget.email.fileList.isNotEmpty) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 150,
        ),
        child: Chip(
          label: Text(
            this.widget.email.fileList[0].filename,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          padding: EdgeInsets.all(0),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.grey[300]),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = new DateTime.now();
    final difference = now.difference(this.widget.email.date.toLocal());

    return Dismissible(
      key: Key(this.widget.email.id),
      background: Container(
        color: Colors.green[700],
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.only(right: 16),
            child: Icon(Icons.archive, color: Colors.white),
          ),
        ),
      ),
      onDismissed: (direction) {
//        setState(() {
//          items.removeAt(index);
//        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        margin: EdgeInsets.only(top: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              maxRadius: 18,
              backgroundColor:
                  ColorAvatar.getColorFromName(this.widget.email.title),
              child: Text(
                this
                    ._unescape
                    .convert(this.widget.email.title)
                    .toUpperCase()
                    .substring(0, 1),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.only(right: 16),
                            child: Text(
                              this._unescape.convert(this.widget.email.title),
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: this.widget.email.isRead
                                    ? FontWeight.w300
                                    : FontWeight.bold,
                                fontSize: 15,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Text(
                          timeago.format(now.subtract(difference)),
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: this.widget.email.isRead
                                ? FontWeight.w300
                                : FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  this
                                      ._unescape
                                      .convert(this.widget.email.object),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: this.widget.email.isRead
                                        ? FontWeight.w300
                                        : FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                child: Text(
                                  this
                                      ._unescape
                                      .convert(this.widget.email.message),
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
                    this._displayFiles(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
