import 'package:flutter/material.dart';

class MyProfileList extends StatelessWidget {

  final String title;
  final IconData iconData;

  const MyProfileList({super.key, required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12,5,12,5),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12)
        ),
        child: ListTile(
          leading: Icon(iconData, color: Theme.of(context).colorScheme.inversePrimary,),
          title: Text(title),
        ),
      ),
    );
  }
}
