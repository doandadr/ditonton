// To parse this JSON data, do
//
//     final tvDetailModel = tvDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/tv/created_by_model.dart';
import 'package:ditonton/data/models/tv/episode_to_air_model.dart';
import 'package:ditonton/data/models/tv/network_model.dart';
import 'package:ditonton/data/models/tv/production_country_model.dart';
import 'package:ditonton/data/models/tv/season_model.dart';
import 'package:ditonton/data/models/tv/spoken_language_model.dart';
import 'package:equatable/equatable.dart';

TvDetailModel tvDetailModelFromJson(String str) =>
    TvDetailModel.fromJson(json.decode(str));

String tvDetailModelToJson(TvDetailModel data) => json.encode(data.toJson());

class TvDetailModel extends Equatable {
  bool adult;
  String backdropPath;
  List<CreatedByModel> createdBy;
  List<dynamic> episodeRunTime;
  String firstAirDate;
  List<GenreModel> genres;
  String homepage;
  int id;
  bool inProduction;
  List<String> languages;
  String lastAirDate;
  EpisodeToAirModel lastEpisodeToAir;
  String name;
  EpisodeToAirModel nextEpisodeToAir;
  List<NetworkModel> networks;
  int numberOfEpisodes;
  int numberOfSeasons;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  List<NetworkModel> productionCompanies;
  List<ProductionCountryModel> productionCountries;
  List<SeasonModel> seasons;
  List<SpokenLanguageModel> spokenLanguages;
  String status;
  String tagline;
  String type;
  double voteAverage;
  int voteCount;

  TvDetailModel({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvDetailModel.fromJson(Map<String, dynamic> json) => TvDetailModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        createdBy: List<CreatedByModel>.from(
            json["created_by"].map((x) => CreatedByModel.fromJson(x))),
        episodeRunTime:
            List<dynamic>.from(json["episode_run_time"].map((x) => x)),
        firstAirDate: json["first_air_date"],
        genres: List<GenreModel>.from(json["genres"].map((x) => GenreModel.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        inProduction: json["in_production"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        lastAirDate: json["last_air_date"],
        lastEpisodeToAir: EpisodeToAirModel.fromJson(json["last_episode_to_air"]),
        name: json["name"],
        nextEpisodeToAir: EpisodeToAirModel.fromJson(json["next_episode_to_air"]),
        networks: List<NetworkModel>.from(
            json["networks"].map((x) => NetworkModel.fromJson(x))),
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<NetworkModel>.from(
            json["production_companies"].map((x) => NetworkModel.fromJson(x))),
        productionCountries: List<ProductionCountryModel>.from(
            json["production_countries"]
                .map((x) => ProductionCountryModel.fromJson(x))),
        seasons:
            List<SeasonModel>.from(json["seasons"].map((x) => SeasonModel.fromJson(x))),
        spokenLanguages: List<SpokenLanguageModel>.from(
            json["spoken_languages"].map((x) => SpokenLanguageModel.fromJson(x))),
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
        "episode_run_time": List<dynamic>.from(episodeRunTime.map((x) => x)),
        "first_air_date": firstAirDate,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "in_production": inProduction,
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "last_air_date": lastAirDate,
        "last_episode_to_air": lastEpisodeToAir.toJson(),
        "name": name,
        "next_episode_to_air": nextEpisodeToAir.toJson(),
        "networks": List<dynamic>.from(networks.map((x) => x.toJson())),
        "number_of_episodes": numberOfEpisodes,
        "number_of_seasons": numberOfSeasons,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies":
            List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries":
            List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
        "spoken_languages":
            List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "type": type,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        createdBy,
        episodeRunTime,
        firstAirDate,
        genres,
        homepage,
        id,
        inProduction,
        languages,
        lastAirDate,
        lastEpisodeToAir,
        name,
        nextEpisodeToAir,
        networks,
        numberOfEpisodes,
        numberOfSeasons,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        seasons,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
      ];
}







