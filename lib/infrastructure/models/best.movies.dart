// To parse this JSON data, do
//
//     final popularMovies = popularMoviesFromJson(jsonString);

import 'dart:convert';

PopularMovies popularMoviesFromJson(String str) => PopularMovies.fromJson(json.decode(str));

String popularMoviesToJson(PopularMovies data) => json.encode(data.toJson());

class PopularMovies {
    PopularMovies({
        this.movieResults,
        this.results,
        this.totalResults,
        this.status,
        this.statusMessage,
    });

    List<MovieResult> movieResults;
    int results;
    String totalResults;
    String status;
    String statusMessage;

    factory PopularMovies.fromJson(Map<String, dynamic> json) => PopularMovies(
        movieResults: List<MovieResult>.from(json["movie_results"].map((x) => MovieResult.fromJson(x))),
        results: json["results"],
        totalResults: json["Total_results"],
        status: json["status"],
        statusMessage: json["status_message"],
    );

    Map<String, dynamic> toJson() => {
        "movie_results": List<dynamic>.from(movieResults.map((x) => x.toJson())),
        "results": results,
        "Total_results": totalResults,
        "status": status,
        "status_message": statusMessage,
    };
}

class MovieResult {
    MovieResult({
        this.title,
        this.year,
        this.imdbId,
    });

    String title;
    String year;
    String imdbId;

    factory MovieResult.fromJson(Map<String, dynamic> json) => MovieResult(
        title: json["title"],
        year: json["year"],
        imdbId: json["imdb_id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "year": year,
        "imdb_id": imdbId,
    };
}
