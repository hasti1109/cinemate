import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfileCard extends StatefulWidget {

  String userName;
  final String emailId;

  MyProfileCard({super.key, required this.userName, required this.emailId});

  @override
  State<MyProfileCard> createState() => _MyProfileCardState();
}

class _MyProfileCardState extends State<MyProfileCard> {

  void editName() {
    final nameController = TextEditingController(text: widget.userName);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure that the bottom sheet is full height
      shape: RoundedRectangleBorder( // Optional: Define a shape for the bottom sheet
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Set to min to match content height
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Edit name',
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(),
                  controller: nameController,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.inversePrimary, // Background color
                        backgroundColor: Theme.of(context).colorScheme.background, // Text color
                        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 25), // Button padding
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.userName = nameController.text;
                        });
                        Navigator.pop(context);
                      },
                      child: Text('Save'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.inversePrimary, // Background color
                        backgroundColor: Theme.of(context).colorScheme.background, // Text color
                        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 25), // Button padding
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  widget.userName,
                  style: GoogleFonts.lato(fontSize: 22, color: Theme.of(context).colorScheme.inversePrimary),
                ),

                const SizedBox(height: 5,),

                Text(
                  widget.emailId,
                  style: GoogleFonts.lato(fontSize: 13, color: Colors.black),
                )
              ],
            ),

            const SizedBox(width: 62,),

            //settings button
            IconButton(
              icon: Icon(Icons.edit),
              color: Theme.of(context).colorScheme.inversePrimary,
              onPressed: editName,
            )
          ],
        ),
      ),
    );
  }
}
