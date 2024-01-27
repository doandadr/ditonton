part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object?> get props => [];
}

class MovieDetailEmpty extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieRecommendationsEmpty extends MovieDetailState {}

class MovieRecommendationsLoading extends MovieDetailState {}

class MovieWatchlistLoading extends MovieDetailState {}

class MovieDetailHasData extends MovieDetailState {
  final MovieDetail result;

  const MovieDetailHasData(this.result);

  @override
  List<Object?> get props => [result];
}

class MovieDetailError extends MovieDetailState {
  final String message;

  const MovieDetailError(this.message);

  @override
  List<Object?> get props => [message];
}

class MovieRecommendationsError extends MovieDetailState {
  final String message;

  const MovieRecommendationsError(this.message);

  @override
  List<Object?> get props => [message];
}

class MovieWatchlistError extends MovieDetailState {
  final String message;

  const MovieWatchlistError(this.message);

  @override
  List<Object?> get props => [message];
}

class MovieWatchlistStatus extends MovieDetailState {
  final bool isAddedToWatchlist;

  const MovieWatchlistStatus(this.isAddedToWatchlist);

  @override
  List<Object?> get props => [isAddedToWatchlist];
}

class MovieWatchlistMessage extends MovieDetailState {
  final String message;

  const MovieWatchlistMessage(this.message);

  @override
  List<Object?> get props => [message];
}

class MovieRecommendationsHasData extends MovieDetailState {
  final List<Movie> result;

  const MovieRecommendationsHasData(this.result);

  @override
  List<Object?> get props => [result];
}
