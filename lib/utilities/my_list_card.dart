import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/lists.dart';
import '../models/lists_model.dart';
import '../models/media_model.dart';
import 'my_detailed_list.dart';

class MyListCard extends StatelessWidget {

  final String listName;
  final IconData icon;
  final List<Media> currentList;

  const MyListCard({super.key, required this.listName, required this.icon, required this.currentList});

  void deleteList(BuildContext context, List<ListModel> customLists, String listName){
    showDialog(
        context: context,
        builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Do you want to delete this list?",
                style: TextStyle(fontSize: 17),),
              content: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        context.read<MyLists>().removeList(listName);
                        Navigator.pop(context);
                      },
                      child: Text('Yes')
                    ),
                    const SizedBox(width: 15,),
                    GestureDetector(
                      onTap: (){Navigator.pop(context);},
                      child: Text('Cancel')
                    )
                  ],
                ),
              ),
            );
        },
    );
  }

  @override
  Widget build(BuildContext context) {

    final customLists = Provider.of<MyLists>(context).customLists;

    return Card(
      color: Theme.of(context).colorScheme.background,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onLongPress: (){deleteList(context, customLists, listName);},
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListDetailView(list: currentList, listName: listName),),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 28,
              ),
              Text(
                listName,
                style: GoogleFonts.robotoCondensed(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
