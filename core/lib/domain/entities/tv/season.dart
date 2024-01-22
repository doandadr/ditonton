
import 'package:equatable/equatable.dart';

class Season extends Equatable {
  int episodeCount;
  int id;
  String name;
  String overview;
  int seasonNumber;
  double voteAverage;

  Season({
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.seasonNumber,
    required this.voteAverage,
  });

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