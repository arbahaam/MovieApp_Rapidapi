// To parse this JSON data, do
//
//     final movieDetail = movieDetailFromJson(jsonString);

import 'dart:convert';

MovieDetail movieDetailFromJson(String str) =>
    MovieDetail.fromJson(json.decode(str));

String movieDetailToJson(MovieDetail data) => json.encode(data.toJson());

class MovieDetail {
  MovieDetail({
    this.title,
    this.description,
    this.tagline,
    this.year,
    this.releaseDate,
    this.imdbId,
    this.imdbRating,
    this.voteCount,
    this.popularity,
    this.youtubeTrailerKey,
    this.rated,
    this.runtime,
    this.genres,
    this.stars,
    this.directors,
    this.countries,
    this.language,
    this.status,
    this.statusMessage,
  });

  String title;
  String description;
  String tagline;
  String year;
  DateTime releaseDate;
  String imdbId;
  String imdbRating;
  String voteCount;
  String popularity;
  String youtubeTrailerKey;
  String rated;
  int runtime;
  List<String> genres;
  List<String> stars;
  List<String> directors;
  List<String> countries;
  List<String> language;
  String status;
  String statusMessage;

  factory MovieDetail.fromJson(Map<String, dynamic> json) => MovieDetail(
        title: json["title"],
        description: json["description"],
        tagline: json["tagline"],
        year: json["year"],
        releaseDate: DateTime.parse(json["release_date"]),
        imdbId: json["imdb_id"],
        imdbRating: json["imdb_rating"],
        voteCount: json["vote_count"],
        popularity: json["popularity"],
        youtubeTrailerKey: json["youtube_trailer_key"],
        rated: json["rated"],
        runtime: json["runtime"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        // stars: List<String>.from(json["stars"].map((x) => x)),
        stars: (json["stars"] as List).map((x) => (x.toString())).toList(),
        directors: List<String>.from(json["directors"].map((x) => x)),
        countries: List<String>.from(json["countries"].map((x) => x)),
        language: List<String>.from(json["language"].map((x) => x)),
        status: json["status"],
        statusMessage: json["status_message"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "tagline": tagline,
        "year": year,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "imdb_id": imdbId,
        "imdb_rating": imdbRating,
        "vote_count": voteCount,
        "popularity": popularity,
        "youtube_trailer_key": youtubeTrailerKey,
        "rated": rated,
        "runtime": runtime,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        // "stars": List<dynamic>.from(stars.map((x) => x)),
        "stars": stars,
        "directors": List<dynamic>.from(directors.map((x) => x)),
        "countries": List<dynamic>.from(countries.map((x) => x)),
        "language": List<dynamic>.from(language.map((x) => x)),
        "status": status,
        "status_message": statusMessage,
      };
}
