import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/tv/created_by.dart';
import 'package:core/domain/entities/tv/network.dart';
import 'package:core/domain/entities/tv/season.dart';
import 'package:equatable/equatable.dart';

class TvDetail extends Equatable{
  bool adult;
  String backdropPath;
  List<CreatedBy> createdBy;
  String firstAirDate;
  List<Genre> genres;
  String homepage;
  int id;
  bool inProduction;
  String lastAirDate;
  String name;
  List<Network> networks;
  int numberOfEpisodes;
  int numberOfSeasons;
  String originalLanguage;
  String overview;
  double popularity;
  String posterPath;
  List<Season> seasons;
  String status;
  String tagline;
  String type;
  double voteAverage;
  int voteCount;

  TvDetail({
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
