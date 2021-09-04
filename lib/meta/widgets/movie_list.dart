import 'package:flutter/material.dart';
import 'package:movie_app/app/shared/colors.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/meta/widgets/movie_item.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
    required this.moviesList,
  }) : super(key: key);

  final List<MovieModel> moviesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: GridView.builder(
        itemCount: moviesList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 5,
          childAspectRatio: 1 / 2,
        ),
        itemBuilder: (context, index) {
          final MovieModel popularMovie = moviesList[index];
          return MovieItem(
            movie: popularMovie,
          );
        },
      ),
    );
  }
}
