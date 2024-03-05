import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/utilities/my_media_tile.dart';
import 'package:provider/provider.dart';

import '../models/movies_shows.dart';

class MoviesTab extends StatelessWidget {
  MoviesTab({super.key});

  final List <String> genres = [
    'Sci-Fi', 'Anime' , 'Thriller', 'Horror'
  ];

  @override
  Widget build(BuildContext context) {

    final movies = context.watch<Medias>().movies;

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
                  padding: const EdgeInsets.only(left: 18, top: 10, bottom: 0),
                  child: Text(
                    genres[index],
                    style: GoogleFonts.lexend(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                //movie tile of that genre
                SizedBox(
                  height: 328,
                  child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(15,2,18,18),
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, movieIndex) {
                        final movie = movies[movieIndex];
                        if (movie.genre == genres[index]){
                          return MyMediaTile(media: movie);
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

