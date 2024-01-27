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

class FetchMovieRecommendations extends MovieDetailEvent {
  final int id;

  const FetchMovieRecommendations(this.id);

  @override
  List<Object?> get props => [id];
}

class FetchMovieWatchlistStatus extends MovieDetailEvent {
  final int id
  ;
  const FetchMovieWatchlistStatus(this.id);

  @override
  List<Object?> get props => [id];
}

class SaveMovieWatchlist extends MovieDetailEvent {
  final MovieDetail movie;

  const SaveMovieWatchlist(this.movie);

  @override
  List<Object?> get props => [movie];
}

class RemoveMovieWatchlist extends MovieDetailEvent {
  final MovieDetail movie;

  const RemoveMovieWatchlist(this.movie);

  @override
  List<Object?> get props => [movie];
}
