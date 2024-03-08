/*
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/media_model.dart';

class FireStoreService{

  final CollectionReference watchListCollection = FirebaseFirestore.instance.collection('watchlist');
  final CollectionReference watchedCollection = FirebaseFirestore.instance.collection('watchlist');

  //adding data to list
  Future<void> addToWatchlist(Media movie){
    return watchListCollection.add({
      'name': movie.name,
      'year': movie.year,
      'rating': movie.rating,
      'imgPath': movie.imgPath,
      'genre': movie.genre,
    });
  }

  Future<void> addToWatched(Media movie) {
    return watchedCollection.add({
      'name': movie.name,
      'year': movie.year,
      'rating': movie.rating,
      'imgPath': movie.imgPath,
      'genre': movie.genre,
    });
  }

  //reading data
  Stream<QuerySnapshot> getWatchlistStream(){
    final moviesStream = watchListCollection.snapshots();
    return moviesStream;
  }

  Stream<QuerySnapshot> getWatchedStream(){
    final moviesStream = watchedCollection.snapshots();
    return moviesStream;
  }

}
*/