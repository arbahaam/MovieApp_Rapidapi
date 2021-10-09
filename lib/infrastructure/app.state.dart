import 'package:flutter/material.dart';
import 'package:rapid_api_provider/infrastructure/api.services.dart';
import 'package:rapid_api_provider/infrastructure/models/best.movies.dart';
import 'package:rapid_api_provider/infrastructure/models/movie.detail.dart';
import 'package:rapid_api_provider/infrastructure/models/movie.search.dart';

class AppState extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  // ------------- Popular Movies ------------
  // ignore: unused_field
  List<MovieResult> _movies;
  List<MovieResult> get movies => _movies;

  void fetchMovies() async {
    _isLoading = true;
    _movies = await ApiService.getInstance.getMovies();
    _isLoading = false;
    notifyListeners();
  }

  // ------------- Popular Movies ------------
  MovieDetail _detail;
  MovieDetail get detail => _detail;

  void getMovieDetail(String imdbid) async {
    _isLoading = true;
    _detail = await ApiService.getInstance.fetchMovieDetail(imdbid);
    _isLoading = false;
    notifyListeners();
  }
  // ------------- Search Movies ------------

  MovieSearch _search;
  MovieSearch get search => _search;
  void fetchSearch(String name) async {
    _isLoading = true;
    _search = await ApiService.getInstance.searchMovie(name);
    _isLoading = false;

    notifyListeners();
  }
}
