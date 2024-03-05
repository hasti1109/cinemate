import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/movies_shows.dart';
import '../utilities/my_media_tile.dart';

class ShowsTab extends StatelessWidget {
  ShowsTab({super.key});

  final List <String> genres = ['Sitcom','Crime Thriller', 'KDrama' , 'Anime', 'Fantasy'];

  @override
  Widget build(BuildContext context) {

    final shows = context.watch<Medias>().shows;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: genres.length,
      itemBuilder: (BuildContext context, int index) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // display the genre name
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    genres[index],
                    style: GoogleFonts.lexend(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                //show tile of that genre
                SizedBox(
                  height: 328,
                  child: ListView.builder(
                      padding:  const EdgeInsets.fromLTRB(15,2,18,18),
                      scrollDirection: Axis.horizontal,
                      itemCount: shows.length,
                      itemBuilder: (context, showIndex) {
                        //get individual show from shows list
                          final show = shows[showIndex];
                          if (show.genre == genres[index]){
                            return MyMediaTile(media: show);
                          }
                          return Container();
                      }
                  ),
                ),
              ]
          ),
        );
      },
    );
  }
}

