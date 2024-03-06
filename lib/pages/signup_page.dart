import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utilities/my_textfields.dart';

class SignUpPage extends StatefulWidget {

  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _confirmPasswordController  = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signUserUp() async{
    //loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );

    try{
      if (_passwordController.text == _confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Navigator.pop(context);
      }
      else{
        Navigator.pop(context);
        showErrorMessage('Passwords do not match.');
      }
    }
    on FirebaseAuthException catch (e){
      // pop the loading circle
      Navigator.pop(context);
      showErrorMessage(e.code);
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
        child: SingleChildScrollView(
          //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(height: 150,),

              Text('Create an account',
                style: GoogleFonts.lexend(
                  fontSize: 30,
                  fontWeight: FontWeight.w600
                ),
              ),

              const SizedBox(height: 40,),

              //name input
              MyTextField(myController: _emailController, inputName: 'Email', hideText: false, onChanged: (){}),

              const SizedBox(height: 20,),

              //email input
              MyTextField(myController: _passwordController, inputName: 'Create password', hideText: true, onChanged: (){}),

              const SizedBox(height: 20,),

              //password input
              MyTextField(myController: _confirmPasswordController, inputName: 'Confirm password', hideText: true, onChanged: (){}),

              const SizedBox(height: 30,),

              //sign up button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signUserUp,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
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
              const SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? ',),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context ,'/loginpage');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40,),

              //or
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25,5,5,0),
                      child: Divider(thickness: 1, color: Colors.grey.shade600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('or', style: TextStyle(color: Colors.grey.shade600),),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5,5,25,0),
                      child: Divider(thickness: 1, color: Colors.grey.shade600),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40,),

              //google signin
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        width: 2
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/google_logo.png',
                          height: 28,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'Sign up with Google',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.inversePrimary
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
