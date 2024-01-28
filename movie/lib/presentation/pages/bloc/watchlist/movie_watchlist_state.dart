part of 'movie_watchlist_bloc.dart';

abstract class MovieWatchlistState extends Equatable {
  const MovieWatchlistState();

  @override
  List<Object?> get props => [];
}

class MovieWatchlistEmpty extends MovieWatchlistState {}

class MovieWatchlistLoading extends MovieWatchlistState {}

class MovieWatchlistHasData extends MovieWatchlistState {
  final List<Movie> result;

  MovieWatchlistHasData(this.result);

  @override
  List<Object?> get props => [result];
}

class MovieWatchlistError extends MovieWatchlistState {
  final String message;

  const MovieWatchlistError(this.message);

  @override
  List<Object?> get props => [message];
}

class MovieWatchlistStatus extends MovieWatchlistState {
  final bool isAddedToWatchlist;

  const MovieWatchlistStatus(this.isAddedToWatchlist);

  @override
  List<Object?> get props => [isAddedToWatchlist];
}

class MovieWatchlistMessage extends MovieWatchlistState {
  final String message;

  const MovieWatchlistMessage(this.message);

  @override
  List<Object?> get props => [message];
}
