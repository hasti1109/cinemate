import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'profile_page.dart';
import 'search_page.dart';
import 'lists_page.dart';
import 'movies_shows_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    MoviesShowsPage(),
    SearchPage(isComingFromList: false,),
    ListsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar:  GNav(
          gap: 5,
          iconSize: 25,
          tabBorderRadius: 30,
          padding: const EdgeInsets.all(20),
          tabMargin: EdgeInsets.all(7),
          backgroundColor: Colors.transparent,
          activeColor: Theme.of(context).colorScheme.inversePrimary,
          tabBackgroundColor: Theme.of(context).colorScheme.primary,
          selectedIndex: _selectedIndex,

          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },

          tabs: const [
            GButton(
              icon: Icons.home_rounded,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search_rounded,
              text: 'Search',
            ),
            GButton(
              icon: Icons.bookmark_border_rounded,
              text: 'My Lists',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ]
      ),
    );
  }
}

