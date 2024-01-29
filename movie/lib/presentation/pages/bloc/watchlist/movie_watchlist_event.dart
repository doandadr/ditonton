part of 'movie_watchlist_bloc.dart';

abstract class MovieWatchlistEvent extends Equatable {
  const MovieWatchlistEvent();

  @override
  List<Object?> get props => [];
}

class FetchWatchlistMovies extends MovieWatchlistEvent {}

class FetchMovieWatchlistStatus extends MovieWatchlistEvent {
  final int id;

  const FetchMovieWatchlistStatus(this.id);

  @override
  List<Object?> get props => [id];
}

class SaveMovieWatchlist extends MovieWatchlistEvent {
  final MovieDetail movie;

  const SaveMovieWatchlist(this.movie);

  @override
  List<Object?> get props => [movie];
}

class RemoveMovieWatchlist extends MovieWatchlistEvent {
  final MovieDetail movie;

  const RemoveMovieWatchlist(this.movie);

  @override
  List<Object?> get props => [movie];
}
