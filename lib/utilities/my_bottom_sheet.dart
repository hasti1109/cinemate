import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/lists.dart';
import '../models/media_model.dart';

class MyBottomSheet extends StatelessWidget {

  final Media media;

  const MyBottomSheet({super.key, required this.media});

  @override
  Widget build(BuildContext context) {

    final customLists = Provider.of<MyLists>(context).customLists;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 10, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  media.name,
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),
                ),
                Text(
                  media.year,
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary
                  ),
                ),
              ],
            ),
          ),

          Divider(thickness: 0.7, color: Theme.of(context).colorScheme.inversePrimary,),

          Expanded(
            child: ListView.builder(
              itemCount: customLists.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: (){
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Icon(Icons.list),
                  title: Text(customLists[index].name),
                  trailing: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                      context.read<MyLists>().addToCustomList(media, customLists[index].name);
                    },
                      child: Icon(Icons.add)
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
