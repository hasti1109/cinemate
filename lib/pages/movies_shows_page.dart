import 'package:flutter/material.dart';
import '../tabs/movies_tab.dart';
import '../tabs/shows_tab.dart';

class MoviesShowsPage extends StatefulWidget {
  const MoviesShowsPage({super.key});

  @override
  State<MoviesShowsPage> createState() => _MoviesShowsPageState();
}

class _MoviesShowsPageState extends State<MoviesShowsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Column(
          children: [
            TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.movie, color: Theme.of(context).colorScheme.inversePrimary,),
                    text: 'Movies',
                  ),
                  Tab(
                    icon: Icon(Icons.tv, color: Theme.of(context).colorScheme.inversePrimary,),
                    text: 'Shows',
                  ),
                ],
              indicatorColor: Theme.of(context).colorScheme.inversePrimary,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            Expanded(
              child:
              TabBarView(
                children: [
                  MoviesTab(),
                  ShowsTab(),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
