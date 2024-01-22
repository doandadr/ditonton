
import 'package:ditonton/domain/entities/tv/season.dart';
import 'package:equatable/equatable.dart';

class SeasonModel extends Equatable {
  int episodeCount;
  int id;
  String name;
  String overview;
  int seasonNumber;
  double voteAverage;

  SeasonModel({
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.seasonNumber,
    required this.voteAverage,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
    episodeCount: json["episode_count"],
    id: json["id"],
    name: json["name"],
    overview: json["overview"],
    seasonNumber: json["season_number"],
    voteAverage: json["vote_average"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "episode_count": episodeCount,
    "id": id,
    "name": name,
    "overview": overview,
    "season_number": seasonNumber,
    "vote_average": voteAverage,
  };

  Season toEntity() {
    return Season(
      episodeCount: this.episodeCount,
      id: this.id,
      name: this.name,
      overview: this.overview,
      seasonNumber: this.seasonNumber,
      voteAverage: this.voteAverage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    episodeCount,
    id,
    name,
    overview,
    seasonNumber,
    voteAverage,
  ];
}