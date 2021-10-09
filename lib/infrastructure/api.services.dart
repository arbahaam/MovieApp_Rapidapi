// ignore_for_file: avoid_print

import 'dart:convert' show json;

import 'package:rapid_api_provider/infrastructure/models/movie.detail.dart';

import 'models/best.movies.dart';
import 'package:http/http.dart' as http;

import 'models/movie.search.dart';

class ApiService {
  static ApiService _instance;

  ApiService._();

  static ApiService get getInstance => _instance = _instance ?? ApiService._();
// ------------ Search Movies services ------

  var headesr3 = {
    'Content-Type': "application/json",
    'x-rapidapi-host': 'movie-database-imdb-alternative.p.rapidapi.com',
    'x-rapidapi-key': '149c1efa3cmsh62f0ea7513586a0p184947jsnb15b0130b319'
  };
  Future<MovieSearch> searchMovie(String name) async {
    var request = await http.get(
        Uri.parse(
            "https://movie-database-imdb-alternative.p.rapidapi.com?s=$name&r=json"),
        headers: headesr3);
    if (request.statusCode == 200) {
      var resMap = json.decode(request.body);
      // final modelList =
      //     resMap.map<MovieSearch>((e) => MovieSearch.fromJson(e)).toList();
      // print(resMap);
      return MovieSearch.fromJson(resMap);
      // return MovieSearch.fromJson(resMap) as List;
    }
    return null;
  }

// ------------ Popular Movies services ------
  var headers = {
    'Content-Type': "application/json",
    'X-RapidAPI-Host': 'movies-tvshows-data-imdb.p.rapidapi.com',
    'X-RapidAPI-Key': '149c1efa3cmsh62f0ea7513586a0p184947jsnb15b0130b319'
  };

  var popUrl =
      "https://movies-tvshows-data-imdb.p.rapidapi.com/?type=get-popular-movies&page=1&year=2021";

  Future<List<MovieResult>> getMovies() async {
    var result = await http.get(Uri.parse(popUrl), headers: headers);
    // ignore: prefer_typing_uninitialized_variables

    if (result.statusCode == 200) {
      var resMap = json.decode(result.body)['movie_results'] as List;
      final modelList =
          resMap.map<MovieResult>((e) => MovieResult.fromJson(e)).toList();
      return modelList;
    }
    return null;
  }

// ------------ Popular Movie detail services ------
  var headers2 = {
    'Content-Type': "application/json",
    'x-rapidapi-host': "movies-tvshows-data-imdb.p.rapidapi.com",
    'x-rapidapi-key': "149c1efa3cmsh62f0ea7513586a0p184947jsnb15b0130b319"
  };

  Future<MovieDetail> fetchMovieDetail(String imdbid) async {
    var result = await http.get(
        Uri.parse(
            "https://movies-tvshows-data-imdb.p.rapidapi.com/?type=get-movie-details&imdb=$imdbid"),
        headers: headers2);
    if (result.statusCode == 200) {
      // var resMap = json.decode(result.body);
      return movieDetailFromJson(result.body);
    }
    return null;
  }
}
