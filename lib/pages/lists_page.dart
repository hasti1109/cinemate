
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/my_newlist_dialog_box.dart';
import '../utilities/my_list_card.dart';

import '../models/lists_model.dart';
import '../models/lists.dart';
import '../models/media_model.dart';
import '../models/movies_shows.dart';


class ListsPage extends StatefulWidget {

  ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {

  final _listController = TextEditingController();

  //inputting new list from user
  void createNewList(){
    showDialog(
        context: context,
        builder: (context) {
          return NewListDialogBox(
              listController: _listController,
              onAdd: (){
                context.read<MyLists>().addNewList(_listController.text);
                _listController.text = "";
                Navigator.of(context).pop();
              },
              onCancel: () {
                _listController.text = "";
                Navigator.of(context).pop();
              },
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    final watchList = Provider.of<Medias>(context).watchList;
    final watchedList = Provider.of<Medias>(context).watchedList;
    final customLists = Provider.of<MyLists>(context).customLists;

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0,18,0,18),
            child: Text(
              'My Lists',
              style: GoogleFonts.lexend(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),

          // "create a new list" card
          Card(
              color: Theme.of(context).colorScheme.inversePrimary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23),
              ),
            child: InkWell(
              onTap: createNewList,
              child: Container(
                width: 165,
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: Text(
                  'Create a new list',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 15,),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.45,
                  ),

                  itemCount: 2 + customLists.length, // Two lists: watchlist and watched
                  itemBuilder: (context, index) {

                    if (index < 2){
                      final List<Media> currentList = index == 0 ? watchList : watchedList;
                      if (index == 0){
                        return MyListCard(listName: 'My WatchList', icon:  Icons.bookmark_border, currentList: currentList);
                      }
                      else{
                        return MyListCard(listName: 'Watched', icon:  Icons.check, currentList: currentList);
                      }
                    }
                    else {
                      final ListModel customList = customLists[index-2];
                      return MyListCard(listName: customList.name, icon: Icons.list, currentList: customList.myList);
                    }
                  },
                ),
            ),
          ),

        ],
      ),
    );
  }
}



