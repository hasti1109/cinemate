import 'package:flutter/cupertino.dart';

import 'media_model.dart';

class Medias extends ChangeNotifier{

  final List <Media> _movies = [
    Media(name: 'Pulp Fiction', rating: '9.2', imgPath: 'assets/pulpfiction.jpg', genre: 'Thriller', year:'1997'),
    Media(name: 'Inception', rating: '7.9', imgPath: 'assets/inception.jpg', genre: 'Sci-Fi', year:'2014'),
    Media(name: 'Your Name', rating: '8.5', imgPath: 'assets/yourname.jpg', genre: 'Anime', year:'2018'),
    Media(name: 'Arrival', rating: '9.0', imgPath: 'assets/arrival.jpg', genre: 'Sci-Fi', year:'2012'),
    Media(name: 'Conjuring', rating: '9.0', imgPath: 'assets/conjuring.jpg', genre: 'Horror', year:'2010'),
    Media(name: 'Spirited Away', rating: '9.0', imgPath: 'assets/spiritedaway.jpg', genre: 'Anime', year:'2010'),
    Media(name: 'Interstellar', rating: '9.0', imgPath: 'assets/interstellar.jpg', genre: 'Sci-Fi', year:'2014'),
    Media(name: 'Howl\'s Moving Castle', rating: '8.2', imgPath: 'assets/howl.jpg', genre: 'Anime', year:'2004'),
    Media(name: 'Blade Runner 2049', rating: '8.0', imgPath: 'assets/bladerunner.jpeg', genre: 'Sci-Fi', year:'2017'),
  ];

  final List <Media> _shows = [
    Media(name: 'Modern Family', year: '2009', rating: '8.5', imgPath: 'assets/modernfamily.jpg', genre: 'Sitcom'),
    Media(name: 'Brooklyn 99', year: '2013', rating: '8.9', imgPath: 'assets/b99.jpg', genre: 'Sitcom'),
    Media(name: 'Superstore', year: '2015', rating: '7.9', imgPath: 'assets/superstore.jpg', genre: 'Sitcom'),
    Media(name: 'Community', year: '2009', rating: '8.5', imgPath: 'assets/community.jpg', genre: 'Sitcom'),
    Media(name: 'The Good Place', year: '2016', rating: '8.7', imgPath: 'assets/goodplace.jpg', genre: 'Sitcom'),
    Media(name: 'Breaking Bad', rating: '9.3', imgPath: 'assets/breakingbad.jpg', genre: 'Crime Thriller', year:'2008'),
    Media(name: 'My Demon', rating: '8.5', imgPath: 'assets/mydemon.jpg', genre: 'KDrama', year:'2023'),
    Media(name: 'Our Beloved Summer', rating: '8.9', imgPath: 'assets/obs.jpg', genre: 'KDrama', year:'2022'),
    Media(name: 'Attack on Titan', rating: '9.0', imgPath: 'assets/aot.jpg', genre: 'Anime', year:'2012'),
    Media(name: 'Jujutsu Kaisen', rating: '9.0', imgPath: 'assets/jjk.jpg', genre: 'Anime', year:'2022'),
    Media(name: 'Haikyuu!', rating: '9.0', imgPath: 'assets/haikyu.jpg', genre: 'Anime', year:'2016'),
    Media(name: 'Game Of Thrones', rating: '9.0', imgPath: 'assets/got.jpg', genre: 'Fantasy', year:'2010'),
  ];


  List <Media> get movies => _movies;
  List <Media> get shows => _shows;

  List<Media> getMoviesList() {
    return _movies;
  }

  List<Media> getShowsList() {
    return _shows;
  }

  List<Media> _watchList = [];
  List<Media> _watchedList = [];

  List <Media> get watchList => _watchList;
  List <Media> get watchedList => _watchedList;


  void addToWatchlist(Media media) {
    _watchList.add(media);
    notifyListeners();
  }

  void addToWatchedList(Media media) {
    _watchedList.add(media);
    notifyListeners();
  }

  void removeFromWatchlist(Media media) {
    _watchList.remove(media);
    notifyListeners();
  }

  void removeFromWatchedList(Media media) {
    _watchedList.remove(media);
    notifyListeners();
  }
}
