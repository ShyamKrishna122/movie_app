import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/app/routes/api_routes.dart';

class UpcomingMoviesAPI {
  final client = http.Client();
  final headers = {
    "Content-type": "application/json",
    "Accept": "application/json",
    "Access-Control-Allow-Origin": '*',
  };

  Future fetchUpcomingMovies() async {
    final Uri uri = Uri.parse(UPCOMING_API_URL);
    final http.Response response = await client.get(
      uri,
      headers: headers,
    );
    final dynamic body = response.body;
    final Map<String, dynamic> parsedMovies = await jsonDecode(body);
    final moviesData = parsedMovies["results"];
    return moviesData;
  }
}
