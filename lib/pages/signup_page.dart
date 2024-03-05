import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utilities/my_textfields.dart';

class SignUpPage extends StatefulWidget {

  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _nameController  = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  /*
  Future<void> signUp(BuildContext context) async {

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } catch (e) {
      //print('Signup failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Signup failed. Please try again.'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }*/

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
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 40,),

              //name input
              MyTextField(myController: _nameController, inputName: 'Name', hideText: false, onChanged: (){}),

              const SizedBox(height: 40,),

              //email input
              MyTextField(myController: _emailController, inputName: 'Email', hideText: false, onChanged: (){}),

              const SizedBox(height: 20,),

              //password input
              MyTextField(myController: _passwordController, inputName: 'Create Password', hideText: true, onChanged: (){}),

              //sign up button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () => (){
                    Navigator.pushNamed(context, '/homepage');
                  },
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
              const SizedBox(height: 20,),

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

              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Divider(height: 1,),
                  Text('or'),
                  Divider(height: 1,),
                ],
              ),

              const SizedBox(height: 20,),

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

              const SizedBox(height: 20,),

            ],
          ),
        ),
      )
    );
  }
}
