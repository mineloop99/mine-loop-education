import 'dart:core';
import 'package:flutter/material.dart';

import '../../../../models/routes.dart';

class PageViewBuilder extends StatefulWidget {
  final Widget widget;
  PageViewBuilder({@required this.widget});
  @override
  _PageViewBuilderState createState() => _PageViewBuilderState();
}

const double _maxExtent = 200;
const double _minExtent = 50;
const double paddingInsets = 0.32;
const double marginInsetsRight = 0.38;
const double iconResizeSpeed = 0.03;
const double fontSizeResizeSpeed = 0.05;
double marginEdge;
double numberTempToCheckDropdownOrNot = 0;
bool isDropdown;

//AppBar Icon Builder
InkWell _inkWellBuilder(
  int index,
  double shrinkOffset,
  IconData icon,
  String title,
  Color iconColorOpacity,
  Color textColorOpacity,
  BuildContext context,
  String urlPath,
) {
  bool isExpanded = shrinkOffset == _maxExtent;
  return InkWell(
    splashColor: Colors.black45,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: index == 0 ? MainAxisSize.min : MainAxisSize.max,
      children: [
        Icon(
          icon,
          color: index == 0 ? Colors.blue : iconColorOpacity,
          size: index == 0
              ? 30
              : 30 + (_maxExtent - shrinkOffset) * iconResizeSpeed,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: index == 0
                ? 0
                : 10 + (_maxExtent - shrinkOffset) * fontSizeResizeSpeed,
            color: index == 0
                ? Colors.black
                : isExpanded
                    ? Colors.black.withOpacity(0)
                    : textColorOpacity,
          ),
        ),
      ],
    ),
    onTap: () {
      Navigator.of(context).pushNamed(urlPath);
    },
  );
}

class _PageViewBuilderState extends State<PageViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: EdgeInsets.only(top: _minExtent),
      child: CustomScrollView(
        slivers: [
          ///// Image and 4 Buttons /////
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: BuildDelegate(),
          ),
          ///// Search, Account and Announcment /////
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: BuildDelegate2(),
          ),
          ///// Body Scroll ///////
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return widget.widget;
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

/// 4 Center-Icons Builder
class BuildDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    //Reduce Request
    // if (isCollapsed) {
    //   final value = Provider.of<HomeProvider>(context, listen: false);
    //   value.setIsCollapsed(isCollapsed);
    // }
    final deviceSize = MediaQuery.of(context).size;
    marginEdge = shrinkOffset * marginInsetsRight - 40;
    double colorOpacity =
        shrinkOffset < maxExtent ? 1 - shrinkOffset / maxExtent : 1;
    var textColorOpacity = Colors.black.withOpacity(colorOpacity);
    var iconColorOpacity = Colors.blue.withOpacity(colorOpacity);
    List<InkWell> _listInkWell = [
      _inkWellBuilder(
          1,
          shrinkOffset,
          Icons.backup_table,
          'Forum',
          iconColorOpacity,
          textColorOpacity,
          context,
          Routes.routeName[RouteNamesEnum.Search]),
      _inkWellBuilder(
          2,
          shrinkOffset,
          Icons.category_outlined,
          'My Course',
          iconColorOpacity,
          textColorOpacity,
          context,
          Routes.routeName[RouteNamesEnum.MyCourse]),
      _inkWellBuilder(
          3,
          shrinkOffset,
          Icons.account_balance,
          'Account',
          iconColorOpacity,
          textColorOpacity,
          context,
          Routes.routeName[RouteNamesEnum.MyAccount]),
      _inkWellBuilder(
          4,
          shrinkOffset,
          Icons.menu_book,
          'Menu',
          iconColorOpacity,
          textColorOpacity,
          context,
          Routes.routeName[RouteNamesEnum.Menu]),
    ];
    return Stack(
      fit: StackFit.expand,
      children: [
        shrinkOffset == maxExtent
            ? SizedBox()
            : Opacity(
                opacity: colorOpacity,
                child: BackGroundImageBuilder(),
              ),
        Container(
          //alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(
              horizontal: 8 + shrinkOffset * paddingInsets),
          margin: EdgeInsets.only(right: marginEdge <= 0 ? 0 : marginEdge),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _listInkWell,
          ),
        ),
        shrinkOffset <= minExtent
            ? Positioned(
                top: 0,
                height: maxExtent - minExtent - 10,
                width: deviceSize.width,
                child: InkWell(
                  child: AbsorbPointer(),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

//// 1 Left 2 Right Icons: 1-Self, 2-Chat, 3-Search
class BuildDelegate2 extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {

    
    if (numberTempToCheckDropdownOrNot > shrinkOffset && !overlapsContent)
    {
      isDropdown = true;
    }
    else 
    {
      isDropdown = false;
    }
    double colorOpacity = 1 - shrinkOffset / maxExtent;
    return 
    shrinkOffset <= minExtent - 45
    ///Search Icon DropDown
        ? Stack(
            children: [
              Positioned(
                right: 12,
                bottom: 8,
                height: minExtent,
                child: Opacity(
                  opacity: shrinkOffset == 0 && !overlapsContent? 1 : isDropdown ? 1 - colorOpacity : 0,
                  child: _inkWellBuilder(
                      0,
                      minExtent,
                      Icons.search,
                      '',
                      Colors.blue,
                      Colors.black,
                      context,
                      Routes.routeName[RouteNamesEnum.Search]),
                ),
              ),
            ],
          )
        :
          // 4 Appear Animation
         Opacity(
            opacity: 1 - colorOpacity,
            child: Stack(
              children: [
                Positioned(
                  left: 15,
                  top: 8,
                  child: _inkWellBuilder(
                      0,
                      minExtent,
                      Icons.account_circle,
                      '',
                      Colors.blue,
                      Colors.black,
                      context,
                      Routes.routeName[RouteNamesEnum.MyAccount]),
                ),
                Positioned(
                  right: 15,
                  top: 8,
                  child: Row(
                    children: [
                      _inkWellBuilder(
                          0,
                          maxExtent,
                          Icons.chat_outlined,
                          '',
                          Colors.blue,
                          Colors.black,
                          context,
                          Routes.routeName[RouteNamesEnum.Chat]),
                      SizedBox(
                        width: 15,
                      ),
                      _inkWellBuilder(
                          0,
                          maxExtent,
                          Icons.search,
                          '',
                          Colors.blue,
                          Colors.black,
                          context,
                          Routes.routeName[RouteNamesEnum.Search]),
                    ],
                  ),
                )
              ],
            ),
          );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

///Background Image asset
class BackGroundImageBuilder extends StatelessWidget {
  const BackGroundImageBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://i.pinimg.com/564x/d3/4c/ef/d34cefdd877969788453a9c98f4b4bd5.jpg',
      fit: BoxFit.cover,
    );
  }
}