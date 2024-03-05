
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utilities/my_textfields.dart';

class LoginPage extends StatefulWidget {

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //method to login user
  void logUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    }

    on FirebaseAuthException catch (e) {
        // pop the loading circle
        Navigator.pop(context);
        //print(e.code);

        // WRONG EMAIL
        if (e.code == 'invalid-email') {
          showErrorMessage('Invalid email id');
        }
        // WRONG PASSWORD
        else if (e.code == 'wrong-password') {
            showErrorMessage("Incorrect Password");
        }
        else {
          showErrorMessage("Incorrect email or password");
        }
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Center(
            child: Text(
              message,
              style: TextStyle(fontSize: 15),
            ),
          ),
          actions: <Widget>[
            Center(
              child: GestureDetector(
                onTap: (){Navigator.of(context).pop();},
                child: Text('Ok'),
              ),
            )
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Icon(Icons.movie_rounded, size: 45.0, color: Theme.of(context).colorScheme.inversePrimary,),

            const SizedBox(height: 30.0,),

            Text(
              'Welcome back!',
              style: GoogleFonts.lexend(
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8.0,),

            Text(
              'You\'ve been missed!',
              style: GoogleFonts.robotoCondensed(fontSize: 18.0,),
            ),

            const SizedBox(height: 44.0,),

            //email input
            MyTextField(myController:_emailController,inputName: 'Email', hideText: false, onChanged: (){},),

            const SizedBox(height: 15.0,),

            //password input
            MyTextField(myController: _passwordController, inputName: 'Password', hideText: true, onChanged: (){},),

            const SizedBox(height: 30.0,),

            //login button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: logUserIn,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  child: Center(
                    child: Text(
                      'Log In',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),


            const SizedBox(height: 20.0,),

            //sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account? ',),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context ,'/signuppage');
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
