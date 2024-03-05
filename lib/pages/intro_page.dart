import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

          // movies image
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('assets/intro_bg.jpg')),
              ),
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.08),

          Text(
            'Explore Movies \n and Shows',
            style: GoogleFonts.delaGothicOne(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 15,),

          Text(
            'from a wide range on collections',
            style: GoogleFonts.signikaNegative(
              fontSize: 17,
            ),
          ),

          const SizedBox(height: 80,),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //signup button
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/signuppage'),
                child: Container(
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                      vertical: 20
                  ),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 20,),

              //login button
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/loginpage'),
                child: Container(
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 20),
                  child: Center(
                    child: Text(
                      'Log In',
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

        ],
      ),

    );
  }
}
