import 'package:flutter/material.dart';
import 'package:movie_app/app/shared/colors.dart';
import 'package:movie_app/meta/views/popular_movies_screen.dart';
import 'package:movie_app/meta/views/top_rated_movies_screen.dart';
import 'package:movie_app/meta/views/upcoming_movies_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Tab> mainTabs = [
    Tab(
      text: "Popular",
      icon: Icon(
        Icons.trending_up,
      ),
    ),
    Tab(
      text: "Top-Rated",
      icon: Icon(
        Icons.favorite,
      ),
    ),
    Tab(
      text: "Upcoming",
      icon: Icon(
        Icons.new_releases,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: mainTabs.length,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: CustomColors.bodybackgroundColor,
        appBar: AppBar(
          backgroundColor: CustomColors.appBackgroundColor,
          title: Text(
            "Book Movie",
          ),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            tabs: mainTabs,
          ),
        ),
        body: TabBarView(
          children: [
            PopularMoviesScreen(),
            TopRatedMoviesScreen(),
            UpcomingMoviesScreen(),
          ],
        ),
      ),
    );
  }
}
