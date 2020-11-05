import 'dart:io';
import 'dart:convert';
import 'movie.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String urlKey = 'api_key=eba51147fe88e6f87503a5e0f6051b64';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';

  Future<List> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    http.Response result = await http.get(upcoming);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((movie) => Movie.fromJson(movie)).toList();

      return movies;
    } else {
      print('Not result!');
      return null;
    }
  }
}
