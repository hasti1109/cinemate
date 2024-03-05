import 'package:flutter/material.dart';

class NewListDialogBox extends StatelessWidget {

  final TextEditingController listController;
  final VoidCallback onAdd;
  final VoidCallback onCancel;

  NewListDialogBox({super.key, required this.listController, required this.onAdd, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 145,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //input list name
            SizedBox(
              width: 240,
              child: TextField(
                controller: listController,
                decoration: InputDecoration(
                  hintText: "List Name",
                  hintStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        width: 1.0,
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        width: 1.0,
                      )
                  ),
                ),
              ),
            ),

            //add and cancel button
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //add list button
                  MaterialButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: onAdd,
                    child: Text('Create'),
                    padding: EdgeInsets.all(11),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // Circular border
                    ),
                  ),

                  //cancel button
                  MaterialButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: onCancel,
                    child: Text('Cancel'),
                    padding: EdgeInsets.all(11),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // Circular border
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
