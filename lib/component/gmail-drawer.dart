import 'package:flutter/material.dart';
import 'package:gmail/component/drawer-item.dart';
import 'package:gmail/component/drawer-label.dart';

class GmailDrawer extends StatefulWidget {
  GmailDrawer({
    Key key,
    this.itemSelected,
    this.onSelectItem,
  }) : super(key: key);

  final int itemSelected;
  final Function(int) onSelectItem;

  @override
  _GmailDrawerState createState() => _GmailDrawerState();
}

class _GmailDrawerState extends State<GmailDrawer> {

  _onSelectItem(int index, BuildContext context) {
    Navigator.of(context).pop(); // close the drawer
    this.widget.onSelectItem(index);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: 16,
              top: 8,
              bottom: 8,
            ),
            child: Text(
              "Gmail",
              style: TextStyle(
                color: Colors.red[700],
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Divider(),
          DrawerItem(
            leadingIcon: Icons.inbox,
            text: 'Primary',
            isSelected: this.widget.itemSelected == 1,
            onTap: () {
              this._onSelectItem(1, context);
            },
          ),
          DrawerItem(
            leadingIcon: Icons.group,
            text: 'Social',
            isTrailing: true,
            trailingText: '3 new',
            selectedColor: Colors.blue[700],
            backgroundColor: Color(0xffe9effd),
            isSelected: this.widget.itemSelected == 2,
            onTap: () {
              this._onSelectItem(2, context);
            },
          ),
          DrawerItem(
            leadingIcon: Icons.local_offer,
            text: 'Promotions',
            isTrailing: true,
            trailingText: '68 new',
            trailingColor: Colors.green[600],
            selectedColor: Colors.green[700],
            backgroundColor: Color(0xffe9f3ea),
            isSelected: this.widget.itemSelected == 3,
            onTap: () {
              this._onSelectItem(3, context);
            },
          ),
          Divider(
            indent: 55,
            height: 1,
          ),
          DrawerItem(
            leadingIcon: Icons.star,
            text: 'Starred',
            isSelected: this.widget.itemSelected == 4,
            onTap: () {
              this._onSelectItem(4, context);
            },
          ),
          DrawerItem(
            leadingIcon: Icons.watch_later,
            text: 'Snoozed',
            isSelected: this.widget.itemSelected == 5,
            onTap: () {
              this._onSelectItem(5, context);
            },
          ),
          DrawerItem(
            leadingIcon: Icons.label_important,
            text: 'Important',
            isSelected: this.widget.itemSelected == 6,
            onTap: () {
              this._onSelectItem(6, context);
            },
          ),
          DrawerItem(
            leadingIcon: Icons.send,
            text: 'Sent',
            isSelected: this.widget.itemSelected == 7,
            onTap: () {
              this._onSelectItem(7, context);
            },
          ),
          DrawerItem(
            leadingIcon: Icons.insert_drive_file,
            text: 'Drafts',
            isSelected: this.widget.itemSelected == 8,
            onTap: () {
              this._onSelectItem(8, context);
            },
          ),
          DrawerItem(
            leadingIcon: Icons.email,
            text: 'All Emails',
            isSelected: this.widget.itemSelected == 9,
            onTap: () {
              this._onSelectItem(9, context);
            },
          ),
          DrawerItem(
            leadingIcon: Icons.warning,
            text: 'Spam',
            isSelected: this.widget.itemSelected == 10,
            onTap: () {
              this._onSelectItem(10, context);
            },
          ),
          DrawerItem(
            leadingIcon: Icons.delete,
            text: 'Bin',
            isSelected: this.widget.itemSelected == 11,
            onTap: () {
              this._onSelectItem(11, context);
            },
          ),
          Divider(
            indent: 55,
            height: 1,
          ),
          DrawerLabel(
            text: "LABELS",
          ),
          DrawerItem(
            leadingIcon: Icons.label,
            text: 'Applichic',
            isSelected: this.widget.itemSelected == 12,
            onTap: () {
              this._onSelectItem(12, context);
            },
          ),
          DrawerItem(
            leadingIcon: Icons.label,
            text: 'Notes',
            isSelected: this.widget.itemSelected == 13,
            onTap: () {
              this._onSelectItem(13, context);
            },
          ),
          Divider(
            indent: 55,
            height: 1,
          ),
          DrawerItem(
            leadingIcon: Icons.add,
            text: 'Create new',
            isSelected: this.widget.itemSelected == 14,
            onTap: () {
              this._onSelectItem(14, context);
            },
          ),
          Divider(
            indent: 55,
            height: 1,
          ),
          DrawerItem(
            leadingIcon: Icons.settings,
            text: 'Settings',
            isSelected: this.widget.itemSelected == 15,
            onTap: () {
              this._onSelectItem(15, context);
            },
          ),
          DrawerItem(
            leadingIcon: Icons.feedback,
            text: 'Send feedback',
            isSelected: this.widget.itemSelected == 16,
            onTap: () {
              this._onSelectItem(16, context);
            },
          ),
          DrawerItem(
            leadingIcon: Icons.help,
            text: 'Help',
            isSelected: this.widget.itemSelected == 17,
            onTap: () {
              this._onSelectItem(17, context);
            },
          ),
        ],
      ),
    );
  }
}
