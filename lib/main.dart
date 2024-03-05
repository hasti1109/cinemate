import 'package:cinemate/pages/home_page.dart';
import 'package:cinemate/pages/intro_page.dart';
import 'package:cinemate/pages/lists_page.dart';
import 'package:cinemate/pages/login_page.dart';
import 'package:cinemate/pages/movies_shows_page.dart';
import 'package:cinemate/pages/profile_page.dart';
import 'package:cinemate/pages/signup_page.dart';
import 'package:cinemate/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/lists.dart';
import 'models/movies_shows.dart';


void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Medias()),
          ChangeNotifierProvider(create: (context) => MyLists())
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/loginpage' : (context) => LoginPage(),
        '/signuppage' : (context) => SignUpPage(),
        '/homepage' : (context) => HomePage(),
        '/moviesshowspage' : (context) => MoviesShowsPage(),
        '/listspage' : (context) => ListsPage(),
        '/profilepage' : (context) => ProfilePage(),
      },
    );
  }
}
