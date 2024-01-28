part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchMovieDetails extends MovieDetailEvent {
  final int id;

  const FetchMovieDetails(this.id);

  @override
  List<Object?> get props => [id];
}
