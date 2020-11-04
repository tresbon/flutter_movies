import 'dart:io';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String urlKey = 'api_key=eba51147fe88e6f87503a5e0f6051b64';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';

  Future<String> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    http.Response result = await http.get(upcoming);
    if (result.statusCode == HttpStatus.ok) {
      String responseBody = result.body;
      return responseBody;
    } else {
      return null;
    }
}
}

