import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie/movie.dart';
import 'package:core/domain/entities/movie/movie_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/usecases/get_watchlist_movies.dart';
import 'package:movie/domain/usecases/get_watchlist_status.dart';
import 'package:movie/domain/usecases/remove_watchlist.dart';
import 'package:movie/domain/usecases/save_watchlist.dart';

part 'movie_watchlist_event.dart';

part 'movie_watchlist_state.dart';

class MovieWatchlistBloc
    extends Bloc<MovieWatchlistEvent, MovieWatchlistState> {
  static const String watchlistAddSuccessMessage = 'Added to Watchlist';
  static const String watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;
  final GetWatchListStatus getWatchListStatus;
  final GetWatchlistMovies getWatchlistMovies;

  MovieWatchlistBloc({
    required this.saveWatchlist,
    required this.removeWatchlist,
    required this.getWatchListStatus,
    required this.getWatchlistMovies,
  }) : super(MovieWatchlistEmpty()) {
    on<FetchMovieWatchlistStatus>((event, emit) async {
      emit(MovieWatchlistLoading());
      final isAddedToWatchlist = await getWatchListStatus.execute(event.id);
      emit(MovieWatchlistStatus(isAddedToWatchlist));
    });

    on<SaveMovieWatchlist>((event, emit) async {
      emit(MovieWatchlistLoading());
      final result = await saveWatchlist.execute(event.movie);

      result.fold((failure) {
        emit(MovieWatchlistError(failure.message));
      }, (data) {
        emit(MovieWatchlistMessage(data));
      });
    });

    on<RemoveMovieWatchlist>((event, emit) async {
      emit(MovieWatchlistLoading());
      final result = await removeWatchlist.execute(event.movie);

      result.fold(
        (failure) {
          emit(MovieWatchlistError(failure.message));
        },
        (data) {
          emit(MovieWatchlistMessage(data));
        },
      );
    });

    on<FetchWatchlistMovies>((event, emit) async {
      emit(MovieWatchlistLoading());
      final result = await getWatchlistMovies.execute();

      result.fold((failure) {
        emit(MovieWatchlistError(failure.message));
      }, (data) {
        if (data.isEmpty) {
          emit(MovieWatchlistEmpty());
        } else {
          emit(MovieWatchlistHasData(data));
        }
      });
    });
  }
}
