import 'package:flutter/cupertino.dart';
import 'package:pra_task/model/Movie.dart';
import 'package:pra_task/network/Webservice.dart';

class MovieListViewModel extends ChangeNotifier {

  List<MovieViewModel> movies = List<MovieViewModel>();

  Future<void> fetchMovies(String keyword) async {
    final results =  await Webservice().fetchMovies(keyword);

    print("results == $results");
    this.movies = results.map((item) => MovieViewModel(movie: item)).toList();
    print(this.movies);
    notifyListeners();
  }

}

class MovieViewModel {

  final Movie movie;

  MovieViewModel({this.movie});

  String get title {
    return this.movie.title;
  }

  String get poster {
    return this.movie.poster;
  }

}