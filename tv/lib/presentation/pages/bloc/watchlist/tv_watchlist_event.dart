part of 'tv_watchlist_bloc.dart';

abstract class TvWatchlistEvent extends Equatable {
  const TvWatchlistEvent();

  @override
  List<Object?> get props => [];
}

class FetchWatchlistTvs extends TvWatchlistEvent {}

class FetchTvWatchlistStatus extends TvWatchlistEvent {
  final int id;

  const FetchTvWatchlistStatus(this.id);

  @override
  List<Object?> get props => [id];
}

class SaveTvWatchlist extends TvWatchlistEvent {
  final TvDetail tv;

  const SaveTvWatchlist(this.tv);

  @override
  List<Object?> get props => [tv];
}

class RemoveTvWatchlist extends TvWatchlistEvent {
  final TvDetail tv;

  const RemoveTvWatchlist(this.tv);

  @override
  List<Object?> get props => [tv];
}
