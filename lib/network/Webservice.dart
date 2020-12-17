import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pra_task/model/Movie.dart';
import 'package:pra_task/utils/CustomException.dart';

class Webservice {

  Future<List<Movie>> fetchMovies(String keyword) async {

    final url = "http://www.omdbapi.com/?s=$keyword&apikey=12be7291";
    final response = await http.get(url);
    print(response);
    switch (response.statusCode) {
      case 200:
        final body = jsonDecode(response.body);
        final Iterable json = body["Search"];
        return json.map((movie) => Movie.fromJson(movie)).toList();
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}