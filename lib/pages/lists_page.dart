import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/movies_shows.dart';
import '../utilities/my_newlist_dialog_box.dart';
import '/models/lists_model.dart';
import 'package:provider/provider.dart';
import '../models/lists.dart';
import '../models/media_model.dart';
import '../utilities/my_list_card.dart';


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

    return Column(
      children: [
        const SizedBox(height: 45,),

        // "create a new list" card
        Card(
            color: Theme.of(context).colorScheme.background,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          child: InkWell(
            onTap: createNewList,
            child: Container(
              width: 150,
              height: 100,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    size: 28,
                  ),

                  Text(
                    'Create new list',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

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
                    final String listName = index == 0 ? 'My Watch List' : 'Watched';
                    return MyListCard(listName: listName, icon: const Icon(Icons.check), currentList: currentList);
                  }
                  else {
                    final ListModel customList = customLists[index-2];
                    return MyListCard(listName: customList.name, icon: const Icon(Icons.list), currentList: customList.myList);
                  }
                },
              ),
          ),
        ),

      ],
    );
  }
}



