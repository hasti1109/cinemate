import 'package:flutter/material.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/lists.dart';
import '../models/media_model.dart';
import '../models/movies_shows.dart';
import '../pages/search_page.dart';
import 'my_detailed_media.dart';

class ListDetailView extends StatelessWidget {

  final List<Media> list;
  final String listName;

  const ListDetailView({super.key, required this.list, required this.listName});

  void removeFromList(BuildContext context, Media media, String listName) {
    showDialog(
      context: context,
      builder: (context) =>
        AlertDialog(
          content: const Text('Remove from your list?'),

          actions: [
            //cancel button
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),

            //yes button
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                if (listName == 'My Watch List'){
                  context.read<Medias>().removeFromWatchlist(media);
                }
                else if (listName == 'Watched'){
                  context.read<Medias>().removeFromWatchedList(media);
                }
                else {
                  context.read<MyLists>().removeFromCustomList(media,listName);
                }

              },
              child: Text('Yes'),
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onPressed: () {}
          ),
        ],
        title: Text(
          listName,
          style:  GoogleFonts.lato(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 22,
              fontWeight: FontWeight.w800
          ),
        ),
      ),


      //individual movies/shows
      body: Consumer<Medias>(
        builder: (context, moviesProvider, child){

          return Consumer<MyLists>(
            builder: (context, customLists, child){
            return GridView.builder(
              gridDelegate: const FlutterzillaFixedGridView(
                  crossAxisCount: 4,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  height: 145
              ),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final media = list[index];
                return GestureDetector(
                  onLongPress: (){
                    removeFromList(context, media, listName);
                  },
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MediaDetailedView(media: media))
                    );
                  },
                  child: SizedBox(
                    width: 100,
                    child: Image.asset(
                      media.imgPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
            },
          );
        },
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                Scaffold(
                  body: SearchPage(isComingFromList: true,)
                )
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}