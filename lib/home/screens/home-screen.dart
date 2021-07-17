import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/pages/class-page.dart' show ClassPage;
import '../widgets/pages/meeting-page.dart';
import '../widgets/pages/events-page.dart';
import '../widgets/pages/home-page/home-page-body.dart';
import '../providers/home-provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = './';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    super.initState();
  }

  Widget buildPageView(HomeProvider _homeProvider) {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        _homeProvider.setCurrentIndexPage(index);
        setState(() {});
      },
      children: [
        HomePage(),
        MeetingPage(),
        ClassPage(),
        EventsPage(),
      ],
    );
  }

  // void bottomTapped(int index) {
  //     _homeProvider.setCurrentIndexPage(index);

  //   pageController.animateToPage(index,
  //     duration: Duration(milliseconds: 500), curve: Curves.ease);
  // }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (ctx, _homeProvider, _) => Scaffold(
        body: buildPageView(_homeProvider),
        bottomNavigationBar: MybottomNavigationBar(pageController),
      ),
    );
  }
}

class MybottomNavigationBar extends StatefulWidget {
  final PageController pageController;

  const MybottomNavigationBar(this.pageController);

  @override
  _MybottomNavigationBarState createState() => _MybottomNavigationBarState();
}

class _MybottomNavigationBarState extends State<MybottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (ctx, _homeProvider, _) => BottomNavigationBar(
        selectedItemColor: Colors.blue,
        backgroundColor: Theme.of(ctx).appBarTheme.backgroundColor,
        currentIndex: _homeProvider.currentIndexPage,
        onTap: (index) {
          _homeProvider.setCurrentIndexPage(index);
          widget.pageController.animateToPage(index,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
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
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}
