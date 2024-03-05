import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/my_profile_list_item.dart';
import '../utilities/my_statistics_card.dart';


class ProfilePage extends StatelessWidget {

  final List <String> statsName = ['Tv Time', 'Episodes Watched', 'Top Tv Genre','Movie Time', 'Movies Watched', 'Top Movie Genre'];
  final List <String> statsDetails = ['48 hours', '120','KDrama', '150 hours', '79', 'Fiction'];


  void logUserOut(BuildContext context){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Center(
            child: Text(
              "Are you sure you want to log out?",
              style: TextStyle(fontSize: 15),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                    FirebaseAuth.instance.signOut();
                    },
                  child: Text('Yes'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){Navigator.of(context).pop();},
                child: Text('Cancel'),
              ),
            ),
          ],
        );
      },
    );
  }

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: EdgeInsets.all(15),
                height: 120,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.primary
                ),
                child: Row(
                  children: [
                    //user profile pic
                    const SizedBox(
                      height: 70,
                      width: 70,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/profile.png'),
                      ),
                    ),
                    const SizedBox(width: 15,),

                    //name and user name
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hasti Gabani',
                          style: GoogleFonts.lato(fontSize: 22, color: Theme.of(context).colorScheme.inversePrimary),
                        ),

                        const SizedBox(height: 5,),

                        Text(
                          'hastigabani1109',
                          style: GoogleFonts.lato(fontSize: 13, color: Colors.black),
                        )
                      ],
                    ),

                    const SizedBox(width: 60,),

                    //settings button
                    IconButton(
                      icon: Icon(Icons.settings),
                      color: Theme.of(context).colorScheme.inversePrimary,
                      onPressed: () {  },)
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 0 ,0),
              child: Text(
                'Stats',
                style: GoogleFonts.nunitoSans(fontSize: 25,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  scrollDirection: Axis.horizontal,
                  itemCount: statsName.length,
                  itemBuilder: (context, index) {
                    return StatisticsCard(statsName: statsName[index], statsDetails: statsDetails[index]);
                  }
              ),
            ),

            //other settings
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 0 ,8),
              child: Text(
                'Other Settings',
                style: GoogleFonts.nunitoSans(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),

            MyProfileList(title: 'Privacy', iconData: Icons.lock,),
            MyProfileList(title: 'Recommendations', iconData: Icons.recommend),
            MyProfileList(title: 'Notifications',iconData: Icons.notifications,),
            MyProfileList(title: 'Themes', iconData: Icons.color_lens,),
            MyProfileList(title: 'Help', iconData: Icons.help,),
            MyProfileList(title: 'About', iconData: Icons.info,),

            GestureDetector(
              onTap: () => logUserOut(context),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12,5,12,5),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: ListTile(
                    leading: Icon(Icons.logout, color: Colors.redAccent,),
                    title: Text('Logout', style: TextStyle(color: Colors.redAccent),),
                  ),
                ),
              ),
            )
            ]
        ),
      )
    );
  }
}