import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home.dart';
// import 'package:flutter_application_1/publicAppBar.dart';
import 'package:flutter_application_1/screen/social_page.dart';
import 'package:flutter_application_1/screen/social_clone1.dart';
import 'package:flutter_application_1/screen/social_clone2.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatefulWidget {
  NavBar({super.key});

  int _currentIndex = 0;
  List screen = [
    const HomePage(),
    const SocialPage(),
    // const SocialClone1(),
    // const SocialClone2()
  ];

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void changePages(int index) {
    setState(() {
      widget._currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: AppBars(elevation: 0, flexibleSpace: Container()),
        // ),
        body: widget.screen[widget._currentIndex],
        bottomNavigationBar: Container(
          color: Color(0xFFE3F2F9),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GNav(
              selectedIndex: 0,
              backgroundColor: const Color(0xFFE3F2F9),
              activeColor: const Color(0xFF2585DE),
              iconSize: 30,
              gap: 8,
              onTabChange: (index) => changePages(index),
              // tabBackgroundColor: Color(0xffD6802B),
              padding: const EdgeInsets.all(15),
              tabs: [
                GButton(icon: Icons.home_filled),
                GButton(icon: Icons.task_rounded),
                GButton(icon: Icons.groups_rounded),
                GButton(icon: Icons.people_rounded)
              ],
            ),
          ),
        ));
  }
}
