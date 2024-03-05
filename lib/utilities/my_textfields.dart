import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final TextEditingController myController;
  final String inputName;
  final bool hideText;
  final VoidCallback onChanged;

  const MyTextField({super.key, required this.myController, required this.inputName, required this.hideText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child:  TextField(
        onChanged: (value)=> onChanged,
        controller: myController,
        obscureText: hideText,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.black)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black),
          ),
          labelStyle: TextStyle(color: Colors.black),
          labelText: inputName,
        ),
      ),
    );
  }
}
