import 'package:flutter/material.dart';

class DrawerItem extends StatefulWidget {
  DrawerItem({
    Key key,
    this.leadingIcon,
    this.isTrailing,
    this.trailingText,
    this.trailingColor,
    this.onTap,
    this.defaultSelected,
    @required this.text,
  }) : super(key: key);

  final IconData leadingIcon;
  final bool isTrailing;
  final String trailingText;
  final Color trailingColor;
  final String text;
  final Function onTap;
  final bool defaultSelected;

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  bool _isSelected = false;
  Color _defaultTrailingColor = Colors.blue[700];
  Color _defaultSelectedColor = Colors.red[600];

  @override
  void initState() {
    super.initState();

    if (this.widget.defaultSelected != null && this.widget.defaultSelected) {
      this.setState(() {
        _isSelected = true;
      });
    }
  }

  Widget _displaysLeading() {
    if (this.widget.leadingIcon != null) {
      return Container(
        child: Icon(
          this.widget.leadingIcon,
          color: this._isSelected ? this._defaultSelectedColor : Colors.grey[600],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _displaysTrailing() {
    if (this.widget.isTrailing != null && this.widget.isTrailing) {
      return Container(
        padding: EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: 9,
          right: 9,
        ),
        decoration: BoxDecoration(
          color: this.widget.trailingColor != null
              ? this.widget.trailingColor
              : this._defaultTrailingColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          this.widget.trailingText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  BoxDecoration _showBackgroundWhenSelected() {
    if(this._isSelected) {
      return BoxDecoration(
        color: Color(0xfff9e9e9),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      );
    } else {
      return BoxDecoration();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.widget.onTap,
      child: Container(
        margin: EdgeInsets.only(right: 6),
        decoration: this._showBackgroundWhenSelected(),
        padding: EdgeInsets.all(14),
        child: Row(
          children: <Widget>[
            this._displaysLeading(),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16),
                child: Text(
                  this.widget.text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: this._isSelected ? this._defaultSelectedColor : Colors.grey[800]
                  ),
                ),
              ),
            ),
            this._displaysTrailing(),
          ],
        ),
      ),
    );
  }
}
