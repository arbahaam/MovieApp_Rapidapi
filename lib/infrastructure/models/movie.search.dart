import 'dart:convert';

MovieSearch movieSearchFromJson(String str) =>
    MovieSearch.fromJson(json.decode(str));

String movieSearchToJson(MovieSearch data) => json.encode(data.toJson());

class MovieSearch {
  MovieSearch({
    this.search,
    this.totalResults,
    this.response,
  });

  List<Search> search;
  String totalResults;
  String response;

  factory MovieSearch.fromJson(Map<String, dynamic> json) => MovieSearch(
        search:
            List<Search>.from(json["Search"].map((x) => Search.fromJson(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
      );

  Map<String, dynamic> toJson() => {
        "Search": List<dynamic>.from(search.map((x) => x.toJson())),
        "totalResults": totalResults,
        "Response": response,
      };
}

class Search {
  Search({
    this.title,
    this.year,
    this.imdbId,
    this.type,
    this.poster,
  });

  String title;
  String year;
  String imdbId;
  String type;
  String poster;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: json["Type"],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": type,
        "Poster": poster,
      };
}
// To parse this JSON data, do

//     final movieSearch = movieSearchFromJson(jsonString);

// import 'dart:convert';

// List<MovieSearch> movieSearchFromJson(String str) => List<MovieSearch>.from(
//     json.decode(str).map((x) => MovieSearch.fromJson(x)));

// String movieSearchToJson(List<MovieSearch> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class MovieSearch {
//   MovieSearch({
//     this.title,
//     this.year,
//     this.imdbId,
//     this.type,
//     this.poster,
//   });

//   String title;
//   String year;
//   String imdbId;
//   String type;
//   String poster;

//   factory MovieSearch.fromJson(Map<String, dynamic> json) => MovieSearch(
//         title: json["Title"],
//         year: json["Year"],
//         imdbId: json["imdbID"],
//         type: json["Type"],
//         poster: json["Poster"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Title": title,
//         "Year": year,
//         "imdbID": imdbId,
//         "Type": type,
//         "Poster": poster,
//       };
// }
