import 'package:flutter/material.dart';

class DrawerItem extends StatefulWidget {
  DrawerItem({
    Key key,
    this.leadingIcon,
    this.isTrailing,
    this.trailingText,
    this.trailingColor,
    this.onTap,
    this.isSelected,
    this.selectedColor,
    this.backgroundColor,
    @required this.text,
  }) : super(key: key);

  final IconData leadingIcon;
  final bool isTrailing;
  final String trailingText;
  final Color trailingColor;
  final Color selectedColor;
  final Color backgroundColor;
  final String text;
  final Function onTap;
  final bool isSelected;

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  Color _trailingColor = Colors.blue[700];
  Color _selectedColor = Colors.red[600];
  Color _backgroundColor = Color(0xfff9e9e9);
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    if (this.widget.backgroundColor != null) {
      this.setState(() {
        _backgroundColor = this.widget.backgroundColor;
      });
    }

    if (this.widget.selectedColor != null) {
      this.setState(() {
        _selectedColor = this.widget.selectedColor;
      });
    }
  }

  Widget _displaysLeading() {
    if (this.widget.leadingIcon != null) {
      return Container(
        child: Icon(
          this.widget.leadingIcon,
          color: this.widget.isSelected ? this._selectedColor : Colors
              .grey[600],
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
              : this._trailingColor,
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

  BoxDecoration _showBackground() {
    if (this.widget.isSelected) {
      return BoxDecoration(
        color: this._backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      );
    } else if (this._isPressed) {
      return BoxDecoration(
        color: this._backgroundColor,
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
    return GestureDetector(
      onTap: this.widget.onTap,
      onTapDown: (TapDownDetails details) {
        this.setState(() {
          _isPressed = true;
        });
      },
      onTapCancel: () {
        this.setState(() {
          _isPressed = false;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 6),
        decoration: this._showBackground(),
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
                      color: this.widget.isSelected
                          ? this._selectedColor
                          : Colors.grey[800]),
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
