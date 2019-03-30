import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_color_avatar/flutter_color_avatar.dart';

class FloatingSearchBar extends StatefulWidget {
  FloatingSearchBar({
    Key key,
    this.drawer,
    @required this.itemBuilder,
    @required this.itemCount,
  }) : super(key: key);

  final Widget drawer;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  @override
  _FloatingSearchBarState createState() => _FloatingSearchBarState();
}

class _FloatingSearchBarState extends State<FloatingSearchBar>
    with TickerProviderStateMixin {
  Widget _test(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: _FloatingSearchBarHeaderDelegate(
        topPadding: MediaQuery.of(context).padding.top,
        snapConfiguration: FloatingHeaderSnapConfiguration(
          vsync: this,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 200),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: this.widget.drawer,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          this._test(context),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              this.widget.itemBuilder,
              childCount: this.widget.itemCount,
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingSearchBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  _FloatingSearchBarHeaderDelegate({
    @required this.topPadding,
    @required this.snapConfiguration,
  });

  final double topPadding;

  @override
  final FloatingHeaderSnapConfiguration snapConfiguration;

  @override
  double get maxExtent => topPadding + (kToolbarHeight);

  @override
  double get minExtent => topPadding + (kToolbarHeight);

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {

    return Card(
      margin: EdgeInsets.only(
        bottom: 8.0,
        right: 8.0,
        left: 8.0,
        top: topPadding,
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
                child: GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    color: Colors.black54,
                  ),
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
                margin: EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  maxRadius: 14,
                  backgroundColor: ColorAvatar.getColorFromName('AP'),
                  child: Text(
                    'AP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
