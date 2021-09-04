import 'package:flutter/cupertino.dart';
import 'package:movie_app/app/routes/api_routes.dart';
import 'package:movie_app/core/api/top_rated_movies_api.dart';
import 'package:movie_app/core/models/movie_model.dart';

class TopRatedMovieNotifier extends ChangeNotifier {
  final TopRatedMoviesAPI _topRatedMoviesAPI = new TopRatedMoviesAPI();

  List<MovieModel> _topRatedMovies = [];
  List<MovieModel> get topRatedMovies => _topRatedMovies;

  Future fetchTopRatedMovies() async {
    try {
      await _topRatedMoviesAPI.fetchTopRatedMovies().then((value) {
        for (var data in value.toList()) {
          _topRatedMovies.add(MovieModel(
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
