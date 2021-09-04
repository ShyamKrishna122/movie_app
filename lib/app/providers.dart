import 'package:movie_app/core/notifiers/popular_movies_notifier.dart';
import 'package:movie_app/core/notifiers/top_rated_movies_notifier.dart';
import 'package:movie_app/core/notifiers/upcoming_movie_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [...remoteProviders];

//Independent Providers
List<SingleChildWidget> remoteProviders = [
  ChangeNotifierProvider(
    create: (_) => PopularMoviesNotifier(),
  ),
  ChangeNotifierProvider(
    create: (_) => TopRatedMovieNotifier(),
  ),
  ChangeNotifierProvider(
    create: (_) => UpcomingMovieNotifier(),
  ),
];