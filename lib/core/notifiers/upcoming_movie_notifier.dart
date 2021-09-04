import 'package:flutter/cupertino.dart';
import 'package:movie_app/app/routes/api_routes.dart';
import 'package:movie_app/core/api/upcoming_movie_api.dart';
import 'package:movie_app/core/models/movie_model.dart';

class UpcomingMovieNotifier extends ChangeNotifier {
  final UpcomingMoviesAPI _upcomingMoviesAPI = new UpcomingMoviesAPI();

  List<MovieModel> _upcomingMovies = [];
  List<MovieModel> get upcomingMovies => _upcomingMovies;

  Future fetchUpcomingMovies() async {
    try {
      await _upcomingMoviesAPI.fetchUpcomingMovies().then((value) {
        for (var data in value.toList()) {
          _upcomingMovies.add(MovieModel(
            movieName: data["title"],
            imageUrl: IMAGE_URL + data["poster_path"],
          ));
        }
      });
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
