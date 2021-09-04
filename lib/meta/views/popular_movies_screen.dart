import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/core/notifiers/popular_movies_notifier.dart';
import 'package:movie_app/meta/widgets/movie_item.dart';
import 'package:movie_app/meta/widgets/movie_list.dart';
import 'package:provider/provider.dart';

class PopularMoviesScreen extends StatefulWidget {
  const PopularMoviesScreen({Key? key}) : super(key: key);

  @override
  _PopularMoviesScreenState createState() => _PopularMoviesScreenState();
}

class _PopularMoviesScreenState extends State<PopularMoviesScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final popularMoviesProvider =
          Provider.of<PopularMoviesNotifier>(context, listen: false);
      if (popularMoviesProvider.popularMovies.length == 0) {
        await popularMoviesProvider.fetchPopularMovies();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<MovieModel> popularMoviesList =
        Provider.of<PopularMoviesNotifier>(context).popularMovies;
    return MovieList(
      moviesList: popularMoviesList,
    );
  }
}