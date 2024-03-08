import 'package:flutter/cupertino.dart';

import 'media_model.dart';

class Medias extends ChangeNotifier{

  final List <Media> _movies = [
    Media(name: 'Drive', rating: '8.1', imgPath: 'assets/drive.jpg', genre: 'Thriller', year:'2011'),
    Media(name: 'Pulp Fiction', rating: '9.2', imgPath: 'assets/pulpfiction.jpg', genre: 'Thriller', year:'1997'),
    Media(name: 'Shutter Island', rating: '8.9', imgPath: 'assets/shutterisland.jpg', genre: 'Thriller', year:'2010'),
    Media(name: 'Gone Girl', rating: '8.7', imgPath: 'assets/gonegirl.jpg', genre: 'Thriller', year:'2014'),
    Media(name: 'Nightcrawler', rating: '8.4', imgPath: 'assets/nightcrawler.jpg', genre: 'Thriller', year:'2014'),
    Media(name: 'Arrival', rating: '9.0', imgPath: 'assets/arrival.jpg', genre: 'Sci-Fi', year:'2012'),
    Media(name: 'Dune', rating: '7.9', imgPath: 'assets/dune.jpg', genre: 'Sci-Fi', year:'2021'),
    Media(name: 'Blade Runner 2049', rating: '8.0', imgPath: 'assets/bladerunner.jpeg', genre: 'Sci-Fi', year:'2017'),
    Media(name: 'The Martian', rating: '8.2', imgPath: 'assets/themartian.jpg', genre: 'Sci-Fi', year:'2015'),
    Media(name: 'Interstellar', rating: '9.0', imgPath: 'assets/interstellar.jpg', genre: 'Sci-Fi', year:'2014'),
    Media(name: 'Inception', rating: '7.9', imgPath: 'assets/inception.jpg', genre: 'Sci-Fi', year:'2014'),
    Media(name: 'Grave of the fireflies', rating: '9.2', imgPath: 'assets/grave.jpg', genre: 'Animated', year:'1988'),
    Media(name: 'Princess Mononoke', rating: '9.3', imgPath: 'assets/princessmono.jpg', genre: 'Animated', year:'1997'),
    Media(name: 'Your Name', rating: '8.5', imgPath: 'assets/yourname.jpg', genre: 'Animated', year:'2018'),
    Media(name: 'Spider-Man: Into the Spider-Verse', rating: '8.5', imgPath: 'assets/spiderman.jpg', genre: 'Animated', year:'2018'),
    Media(name: 'Spirited Away', rating: '9.0', imgPath: 'assets/spiritedaway.jpg', genre: 'Animated', year:'2010'),
    Media(name: 'Howl\'s Moving Castle', rating: '8.2', imgPath: 'assets/howl.jpg', genre: 'Animated', year:'2004'),
    Media(name: 'Conjuring', rating: '9.0', imgPath: 'assets/conjuring.jpg', genre: 'Horror', year:'2010'),
    Media(name: 'Hereditary', year: '2018', rating: '8.2', imgPath: 'assets/hereditary.jpg', genre: 'Horror'),
    Media(name: 'Insidious', year: '2010', rating: '7.4', imgPath: 'assets/insidious.jpg', genre: 'Horror'),
    Media(name: 'Get Out', year: '2017', rating: '8.5', imgPath: 'assets/getout.jpg', genre: 'Horror'),
    Media(name: 'The Shining', year: '1980', rating: '8.4', imgPath: 'assets/shining.jpg', genre: 'Horror'),
    Media(name: 'Us', year: '2019', rating: '8.7', imgPath: 'assets/us.jpg', genre: 'Horror'),
  ];

  final List <Media> _shows = [
    Media(name: 'Modern Family', year: '2009', rating: '8.5', imgPath: 'assets/modernfamily.jpg', genre: 'Sitcom'),
    Media(name: 'Brooklyn 99', year: '2013', rating: '8.9', imgPath: 'assets/b99.jpg', genre: 'Sitcom'),
    Media(name: 'Superstore', year: '2015', rating: '7.9', imgPath: 'assets/superstore.jpg', genre: 'Sitcom'),
    Media(name: 'Community', year: '2009', rating: '8.5', imgPath: 'assets/community.jpg', genre: 'Sitcom'),
    Media(name: 'The Good Place', year: '2016', rating: '8.7', imgPath: 'assets/goodplace.jpg', genre: 'Sitcom'),
    Media(name: 'Breaking Bad', rating: '9.3', imgPath: 'assets/breakingbad.jpg', genre: 'Thriller', year:'2008'),
    Media(name: 'The Haunting of Hill House', rating: '8.3', imgPath: 'assets/haunting.jpg', genre: 'Thriller', year:'2018'),
    Media(name: 'Alice in Borderland', rating: '7.7', imgPath: 'assets/alice.jpg', genre: 'Thriller', year:'2020'),
    Media(name: 'Stranger Things', rating: '9.3', imgPath: 'assets/stranger.jpg', genre: 'Thriller', year:'2016'),
    Media(name: 'Squid Game', rating: '8.0', imgPath: 'assets/squidgame.jpg', genre: 'KDrama', year:'2021'),
    Media(name: 'My Demon', rating: '8.5', imgPath: 'assets/mydemon.jpg', genre: 'KDrama', year:'2023'),
    Media(name: 'Our Beloved Summer', rating: '8.9', imgPath: 'assets/obs.jpg', genre: 'KDrama', year:'2022'),
    Media(name: 'Attack on Titan', rating: '9.0', imgPath: 'assets/aot.jpg', genre: 'Anime', year:'2012'),
    Media(name: 'Pluto', rating: '9.1', imgPath: 'assets/pluto.jpg', genre: 'Anime', year:'2004'),
    Media(name: 'Monster', rating: '9.3', imgPath: 'assets/monster.jpg', genre: 'Anime', year:'2023'),
    Media(name: 'Jujutsu Kaisen', rating: '9.0', imgPath: 'assets/jjk.jpg', genre: 'Anime', year:'2022'),
    Media(name: 'Haikyuu!', rating: '8.5', imgPath: 'assets/haikyu.jpg', genre: 'Anime', year:'2016'),
    Media(name: 'Game Of Thrones', rating: '9.0', imgPath: 'assets/got.jpg', genre: 'Fiction', year:'2010'),
    Media(name: 'Shadow and Bone', rating: '7.5', imgPath: 'assets/sab.jpg', genre: 'Fiction', year:'2021'),
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
