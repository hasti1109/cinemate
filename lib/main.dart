import 'package:cinemate/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'pages/home_page.dart';
import 'pages/intro_page.dart';
import 'pages/lists_page.dart';
import 'pages/login_page.dart';
import 'pages/movies_shows_page.dart';
import 'pages/profile_page.dart';
import 'pages/signup_page.dart';
import 'themes/light_mode.dart';
import 'models/lists.dart';
import 'models/movies_shows.dart';


bool isDarkMode = true;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Medias()),
          ChangeNotifierProvider(create: (context) => MyLists())
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {

  MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: isDarkMode? ThemeMode.dark : ThemeMode.light,
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



class ThemeChangePage extends StatefulWidget {

  @override
  State<ThemeChangePage> createState() => _ThemeChangePageState();
}

class _ThemeChangePageState extends State<ThemeChangePage> {
  // Function to toggle theme
  void toggleTheme(bool isDark) {
    setState((){
      isDarkMode = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Theme'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                toggleTheme(false); // Light theme
              },
              child: Text('Light Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                toggleTheme(true); // Dark theme
              },
              child: Text('Dark Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
