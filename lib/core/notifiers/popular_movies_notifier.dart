import 'package:flutter/material.dart';
import 'package:movie_app/app/routes/api_routes.dart';
import 'package:movie_app/core/api/popular_movies_api.dart';
import 'package:movie_app/core/models/movie_model.dart';

class PopularMoviesNotifier extends ChangeNotifier {
  final PopularMoviesAPI _popularMoviesAPI = new PopularMoviesAPI();

  List<MovieModel> _popularMovies = [];
  List<MovieModel> get popularMovies => _popularMovies;

  Future fetchPopularMovies() async {
    try {
      await _popularMoviesAPI.fetchPopularMovies().then((value) {
        for (var data in value.toList()) {
          _popularMovies.add(MovieModel(
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
