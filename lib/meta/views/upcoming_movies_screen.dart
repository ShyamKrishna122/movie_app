import 'package:flutter/material.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/core/notifiers/upcoming_movie_notifier.dart';
import 'package:movie_app/meta/widgets/movie_list.dart';
import 'package:provider/provider.dart';

class UpcomingMoviesScreen extends StatefulWidget {
  const UpcomingMoviesScreen({Key? key}) : super(key: key);

  @override
  _UpcomingMoviesScreenState createState() => _UpcomingMoviesScreenState();
}

class _UpcomingMoviesScreenState extends State<UpcomingMoviesScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final upcomingMoviesProvider =
          Provider.of<UpcomingMovieNotifier>(context, listen: false);
      if (upcomingMoviesProvider.upcomingMovies.length == 0) {
        await upcomingMoviesProvider.fetchUpcomingMovies();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<MovieModel> upcomingMoviesList =
        Provider.of<UpcomingMovieNotifier>(context).upcomingMovies;
    return MovieList(
      moviesList: upcomingMoviesList,
    );
  }
}
