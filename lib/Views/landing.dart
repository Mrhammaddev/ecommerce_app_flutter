import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'home.dart';

final PersistentTabController bottomTabController =
    PersistentTabController(initialIndex: 0);

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        HomeScreen(),
        HomeScreen(),
        HomeScreen(),
        HomeScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.home,
            size: 25,
          ),
          title: ("Home"),
          activeColorPrimary: Theme.of(context).primaryColor,
          inactiveColorPrimary: Theme.of(context).primaryColor,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.bookmark,
            size: 25,
          ),
          title: ("Bookmarks"),
          activeColorPrimary: Theme.of(context).primaryColor,
          inactiveColorPrimary: Theme.of(context).primaryColor,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.book_online_rounded,
            size: 25,
          ),
          title: ("My Courses"),
          activeColorPrimary: Theme.of(context).primaryColor,
          inactiveColorPrimary: Theme.of(context).primaryColor,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.message,
            size: 25,
          ),
          title: ("Home"),
          activeColorPrimary: Theme.of(context).primaryColor,
          inactiveColorPrimary: Theme.of(context).primaryColor,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: bottomTabController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,

      backgroundColor: Theme.of(context)
          .bottomAppBarTheme
          .color!, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8.0,
            )
          ],
          borderRadius: BorderRadius.circular(25.0),
          colorBehindNavBar: Color.fromARGB(255, 0, 0, 0)),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.easeInExpo,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}
