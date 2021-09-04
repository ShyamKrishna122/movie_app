import 'package:flutter/material.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/core/notifiers/top_rated_movies_notifier.dart';
import 'package:movie_app/meta/widgets/movie_list.dart';
import 'package:provider/provider.dart';

class TopRatedMoviesScreen extends StatefulWidget {
  const TopRatedMoviesScreen({Key? key}) : super(key: key);

  @override
  _TopRatedMoviesScreenState createState() => _TopRatedMoviesScreenState();
}

class _TopRatedMoviesScreenState extends State<TopRatedMoviesScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final topRatedMoviesProvider =
          Provider.of<TopRatedMovieNotifier>(context, listen: false);
      if (topRatedMoviesProvider.topRatedMovies.length == 0) {
        await topRatedMoviesProvider.fetchTopRatedMovies();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<MovieModel> topRatedMoviesList =
        Provider.of<TopRatedMovieNotifier>(context).topRatedMovies;
    return MovieList(
      moviesList: topRatedMoviesList,
    );
  }
}
