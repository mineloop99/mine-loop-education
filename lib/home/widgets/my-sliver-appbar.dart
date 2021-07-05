import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/home-provider.dart';

class MySliverAppBar extends StatefulWidget {
  @override
  _MySliverAppBarState createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  bool _pinned;
  bool _snap;
  bool _floating;

  @override
  void initState() {
    final _homeProvider = Provider.of<HomeProvider>(context, listen: false);
    _pinned = _homeProvider.pinned;
    _snap = _homeProvider.snap;
    _floating = _homeProvider.floating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Top');
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: _pinned,
          snap: _snap,
          floating: _floating,
          expandedHeight: 50,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text('SliverAppBar'),
            background: FlutterLogo(),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
            child: Center(
              child: Text('Scroll to see the SliverAppBar in effect.'),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                color: index.isOdd ? Colors.white : Colors.black12,
                height: 100.0,
                child: Center(
                  child: Text('$index', textScaleFactor: 5),
                ),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
