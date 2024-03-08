import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/media_model.dart';
import '../models/movies_shows.dart';
import '../utilities/my_bottom_sheet.dart';
import '../utilities/my_detailed_media.dart';

class SearchPage extends StatefulWidget {

  //if im coming from lists page to search media to add to that list
  final bool isComingFromList ;

  const SearchPage({super.key, required this.isComingFromList});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  void addToList(BuildContext context, Media media){
    showModalBottomSheet(
      context: context,
      builder: (context) => MyBottomSheet(media: media),
    );
  }

  static List<Media> combinedList = Medias().getMoviesList() + Medias().getShowsList();
  List<Media> displayList = List.from(combinedList);

  Widget build(BuildContext context) {

    bool isComingFromList = widget.isComingFromList;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),

            //top text
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Search for a movie or a show',
                style: GoogleFonts.lato(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.w800
                ),
              ),
            ),

            //Search Bar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    displayList = combinedList.where( (element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
                  });
                },
                cursorColor: Theme.of(context).colorScheme.inversePrimary,
                style: GoogleFonts.lato(color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Theme.of(context).colorScheme.primary,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "eg: Interstellar",
                  hintStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                  prefixIcon: Icon(Icons.search,color: Theme.of(context).colorScheme.inversePrimary,),
                  prefixIconColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),

            const SizedBox(height: 20,),

            //list of all movies and shows
            Expanded(
              child: ListView.builder(
                itemCount: displayList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    if (isComingFromList){
                      addToList(context, displayList[index]);
                    }
                    else{
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MediaDetailedView(media: displayList[index]))
                      );
                    }
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    title: Text(displayList[index].name, style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(displayList[index].year,),
                    trailing: Text(displayList[index].rating, style: TextStyle(color: Colors.amber, fontSize: 15),),
                    leading: Image.asset(displayList[index].imgPath),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}