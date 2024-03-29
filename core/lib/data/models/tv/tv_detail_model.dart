// To parse this JSON data, do
//
//     final tvDetailResponse = tvDetailResponseFromJson(jsonString);

import 'dart:convert';

import 'package:core/data/models/genre_model.dart';
import 'package:core/data/models/tv/created_by_model.dart';
import 'package:core/data/models/tv/network_model.dart';
import 'package:core/data/models/tv/season_model.dart';
import 'package:core/domain/entities/tv/tv_detail.dart';
import 'package:equatable/equatable.dart';

TvDetailResponse tvDetailResponseFromJson(String str) =>
    TvDetailResponse.fromJson(json.decode(str));

String tvDetailResponseToJson(TvDetailResponse data) =>
    json.encode(data.toJson());

class TvDetailResponse extends Equatable {
  bool adult;
  String backdropPath;
  List<CreatedByModel> createdBy;
  String firstAirDate;
  List<GenreModel> genres;
  String homepage;
  int id;
  bool inProduction;
  String lastAirDate;
  String name;
  List<NetworkModel> networks;
  int numberOfEpisodes;
  int numberOfSeasons;
  String originalLanguage;
  String overview;
  double popularity;
  String posterPath;
  List<SeasonModel> seasons;
  String status;
  String tagline;
  String type;
  double voteAverage;
  int voteCount;

  TvDetailResponse({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.lastAirDate,
    required this.name,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originalLanguage,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.seasons,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvDetailResponse.fromJson(Map<String, dynamic> json) =>
      TvDetailResponse(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        createdBy: List<CreatedByModel>.from(
            json["created_by"].map((x) => CreatedByModel.fromJson(x))),
        firstAirDate: json["first_air_date"],
        genres: List<GenreModel>.from(
            json["genres"].map((x) => GenreModel.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        inProduction: json["in_production"],
        lastAirDate: json["last_air_date"],
        name: json["name"],
        networks: List<NetworkModel>.from(
            json["networks"].map((x) => NetworkModel.fromJson(x))),
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        originalLanguage: json["original_language"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        seasons: List<SeasonModel>.from(
            json["seasons"].map((x) => SeasonModel.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        type: json["type"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "created_by": List<dynamic>.from(createdBy.map((x) => x.toJson())),
        "first_air_date": firstAirDate,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "in_production": inProduction,
        "last_air_date": lastAirDate,
        "name": name,
        "networks": List<dynamic>.from(networks.map((x) => x.toJson())),
        "number_of_episodes": numberOfEpisodes,
        "number_of_seasons": numberOfSeasons,
        "original_language": originalLanguage,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "type": type,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  // TODO to entity
  TvDetail toEntity() {
    return TvDetail(
      adult: adult,
      backdropPath: backdropPath,
      createdBy: createdBy.map((cb) => cb.toEntity()).toList(),
      firstAirDate: firstAirDate,
      genres: genres.map((genre) => genre.toEntity()).toList(),
      homepage: homepage,
      id: id,
      inProduction: inProduction,
      lastAirDate: lastAirDate,
      name: name,
      networks: networks.map((network) => network.toEntity()).toList(),
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons,
      originalLanguage: originalLanguage,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      seasons: seasons.map((season) => season.toEntity()).toList(),
      status: status,
      tagline: tagline,
      type: type,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        adult,
        backdropPath,
        createdBy,
        firstAirDate,
        genres,
        homepage,
        id,
        inProduction,
        lastAirDate,
        name,
        networks,
        numberOfEpisodes,
        numberOfSeasons,
        originalLanguage,
        overview,
        popularity,
        posterPath,
        seasons,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
      ];
}
