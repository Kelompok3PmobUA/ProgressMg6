import 'package:flutter/material.dart';
import 'package:project/screens/home.dart';
import 'package:project/screens/social_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatefulWidget {
  int currentIndex = 0;
  List pages = [
    HomePage(
      items: [],
    ),
    SocialPage()
  ];

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.pages[widget.currentIndex],
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: GNav(
            backgroundColor: Color(0xFF),
            activeColor: Color(0xFF2585DE),
            iconSize: 25,
            selectedIndex: 0,
            gap: 8,
            tabBackgroundColor: Color(0xffD6802B),
            padding: EdgeInsets.all(16),
            onTabChange: (index) {
              setState(() {
                widget.currentIndex = index;
              });
            },
            tabs: [
              GButton(icon: Icons.home_filled),
              GButton(icon: Icons.task_rounded),
              GButton(icon: Icons.groups_rounded),
              GButton(icon: Icons.people_rounded)
            ],
          ),
        ));
  }
}
