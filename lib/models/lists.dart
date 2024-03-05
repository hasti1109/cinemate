import 'package:flutter/cupertino.dart';
import 'lists_model.dart';
import 'media_model.dart';

class MyLists extends ChangeNotifier{
  List<ListModel> _customLists =[
    ListModel(name: 'kdrama', myList: []),
    ListModel(name: 'anime', myList: [])
  ];

  List <ListModel> get customLists => _customLists;

  //creating a new list
  void addNewList(String name){
    _customLists.add(ListModel(name: name, myList: []));
    notifyListeners();
  }

  //deleting a list
  void removeList(String name){
    _customLists.removeWhere((list) => list.name == name);
    notifyListeners();
  }

  //adding items to custom list
  void addToCustomList(Media media, String listName){
    for(int i=0; i<_customLists.length; i++){
      if (_customLists[i].name == listName){
        _customLists[i].myList.add(media);
      }
    }
    notifyListeners();
  }

  //removing items from custom list
  void removeFromCustomList(Media media, String listName){
    for(int i=0; i<_customLists.length; i++){
      if (_customLists[i].name == listName){
        _customLists[i].myList.remove(media);
      }
    }
    notifyListeners();
  }
}