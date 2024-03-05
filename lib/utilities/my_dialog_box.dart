import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/media_model.dart';
import '../models/movies_shows.dart';


class MyDialogBox extends StatelessWidget {

  final Media media ;
  const MyDialogBox({super.key, required this.media});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text(
        'Add to your list?',
        style: TextStyle(fontSize: 15),
      ),

      content: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<Medias>().addToWatchlist(media);
                    },
                    child: Icon(Icons.bookmark_border_rounded),
                  ),
                  Text('Watchlist'),
                ],
              ),
            ),

            Expanded(
              child: Column(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<Medias>().addToWatchedList(media);
                    },
                    child: Icon(Icons.check),
                  ),
                  Text('Watched'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.cancel),
                  ),
                  Text('Cancel'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
