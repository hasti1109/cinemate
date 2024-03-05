import 'package:flutter/material.dart';
import '../models/media_model.dart';
import 'my_bottom_sheet.dart';
import 'my_detailed_media.dart';
import 'my_dialog_box.dart';

class MyMediaTile extends StatelessWidget {

  final Media media;

  const MyMediaTile({
    super.key,
    required this.media,
  });

  Future <void> addToList(BuildContext context) async{
    showDialog <void>(
      context: context,
      builder: (context) => MyDialogBox(media: media),
    );
  }

  Future <void> addToCustomList(BuildContext context, Media media) async{
    showModalBottomSheet(
        context: context, 
        builder: (context) => MyBottomSheet(media: media)
    );
  }

  void showDetails(BuildContext context, Media media){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MediaDetailedView(media: media))
    );
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => showDetails(context, media),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),

        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        width: 148,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //image
            GestureDetector(
              onLongPress: () => addToCustomList(context, media),
              child: SizedBox(
                  height: 180,
                  width: 130,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset(media.imgPath),
                  )
              ),
            ),

            const SizedBox(height: 7,),

            //name
            SizedBox(
              height: 40,
              child: Text(
                media.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),

            //ratings and add button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 15,),
                const SizedBox(width: 5,),
                //ratings
                Text(
                  media.rating,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),

                const SizedBox(width: 45,),

                //add to list button
                IconButton(
                  icon: Icon(Icons.favorite_border_rounded, color: Colors.red, size: 20),
                  onPressed: () => addToList(context),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

