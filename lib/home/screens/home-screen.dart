import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/pages/class-page.dart' show ClassPage;
import '../widgets/pages/meeting-page.dart';
import '../widgets/pages/events-page.dart';
import '../widgets/pages/home-page.dart';
import '../../home/providers/home-provider.dart';

StreamController<int> streamController = StreamController<int>();

class HomeScreen extends StatefulWidget {
  static const routeName = './';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider _homeProvider;

  Stream<int> stream = streamController.stream;
  PageController pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    super.initState();
    _homeProvider = Provider.of<HomeProvider>(context, listen: false);
    try {
      stream.listen((index) {
        bottomTapped(index);
      });
    } catch (error) {}
  }

  void pageChanged(int index) {
    _homeProvider.setCurrentIndexPage(index);
    setState(() {});
  }

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: [
        HomePage(),
        MeetingPage(),
        ClassPage(),
        EventsPage(),
      ],
    );
  }

  void bottomTapped(int index) {
    setState(() {
      _homeProvider.setCurrentIndexPage(index);
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: MybottomNavigationBar(),
    );
  }
}

class MybottomNavigationBar extends StatefulWidget {
  const MybottomNavigationBar({Key key}) : super(key: key);

  @override
  _MybottomNavigationBarState createState() => _MybottomNavigationBarState();
}

class _MybottomNavigationBarState extends State<MybottomNavigationBar> {
  HomeProvider _homeProvider;
  @override
  void initState() {
    super.initState();
    _homeProvider = Provider.of<HomeProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      currentIndex: _homeProvider.currentIndexPage,
      onTap: (index) {
        streamController.add(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_call),
          label: 'Meeting',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Class',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_available),
          label: 'Events',
        ),
      ],
    );
  }
}
