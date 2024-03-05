import 'package:cinemate/pages/home_page.dart';
import 'package:cinemate/pages/intro_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            //Navigator.pop(context);
            return HomePage();
          }
          //user is not logged in
          else {
            return IntroPage();
          }
        },
      )
    );
  }
}