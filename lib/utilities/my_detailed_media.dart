import '../models/movies_shows.dart';
import '../models/media_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_bottom_sheet.dart';

class MediaDetailedView extends StatefulWidget {

  final Media media;

  const MediaDetailedView({super.key, required this.media});

  @override
  State<MediaDetailedView> createState() => _MediaDetailedViewState();
}

class _MediaDetailedViewState extends State<MediaDetailedView> {

  void showSnackBar(String message){
    final snackBar = SnackBar(
      content: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(message, style: TextStyle(fontSize: 15,color: Theme.of(context).colorScheme.inversePrimary),),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Details'),),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  //movie image
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0,30,15,0),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                      height: 150,
                      width: 100,
                      child: Image.asset(widget.media.imgPath),
                    ),
                  ),

                  //name, director, release year, duration
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 18,),
                        //movie name
                        Text(
                          widget.media.name,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        SizedBox(height: 15,),
                        //director name
                        Text('DIRECTED BY'),
                        Text(
                          'Christopher Nolan',
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15,),

                        //release date and duration
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(widget.media.year),
                            const SizedBox(width: 20,),
                            Text('2h 28m'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),

                  //ratings
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              isFavorited = !isFavorited;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              isFavorited ? Icons.favorite : Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          widget.media.rating,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        Text('IMDB'),
                      ],
                    ),
                  ),
                ],
              ),

              // list tile for lists
              Padding(
                padding: EdgeInsets.fromLTRB(15,20,15,20),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //reminders
                      Column(children: [Icon(Icons.notifications_none_outlined,), Text('Reminders')],),

                      //watchlist
                      GestureDetector(
                        onTap: () {
                          context.read<Medias>().addToWatchlist(widget.media);
                          showSnackBar('Added to Watchlist!');
                          },
                          child: const Column(children: [Icon(Icons.bookmark_border), Text('Watchlist')],)
                      ),

                      //my lists
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => MyBottomSheet(media: widget.media)
                          );
                        },
                          child: Column(children: [Icon(Icons.list_outlined), Text('All Lists')])
                      ),

                      //watched
                      GestureDetector(
                        onTap: () {
                          context.read<Medias>().addToWatchedList(widget.media);
                          showSnackBar('Marked as Watched!');
                        },
                          child: const Column(children: [Icon(Icons.check), Text('Watched')],)
                      ),
                    ],
                  ),
                ),
              ),

              //description
              Padding(
                padding: const EdgeInsets.fromLTRB(15,0,15,10),
                child: Text('Synopsis',
                  style: GoogleFonts.lexend(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(15,0,15,10),
                child: Text(
                  'A thief who steals corporate secrets through the use '
                  'of dream-sharing technology is given the inverse task of planting '
                  'an idea into the mind of a C.E.O., but his tragic past may doom the '
                  'project and his team to disaster.'
                ),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(15,10,15,10),
                child: Divider(height: 1,),
              ),

              //where to watch
              Padding(
                padding: const EdgeInsets.fromLTRB(15,0,15,10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Where to watch ',
                      style: GoogleFonts.lexend(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary
                      ),
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/netflix.png'),
                          ),
                        ),
                        SizedBox(width: 5,),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/primevideo.png'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15,10,15,10),
                child: Divider(height: 1,),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(15,10,15,10),
                child:Text('Cast and Crew',
                  style: GoogleFonts.lexend(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child:  Column(
                          children: [
                            const SizedBox(
                              height: 60,
                              width: 60,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage('assets/profile.png'),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width/4,
                                child: const Center(child: Text('Name Surname'))
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
