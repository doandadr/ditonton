import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie/movie.dart';
import 'package:core/domain/entities/movie/movie_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/usecases/get_movie_detail.dart';
import 'package:movie/domain/usecases/get_movie_recommendations.dart';
import 'package:movie/domain/usecases/get_watchlist_status.dart';
import 'package:movie/domain/usecases/remove_watchlist.dart';
import 'package:movie/domain/usecases/save_watchlist.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  static const String watchlistAddSuccessMessage = 'Added to Watchlist';
  static const String watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetMovieDetail getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;
  final GetWatchListStatus getWatchListStatus;

  MovieDetailBloc({
    required this.getMovieDetail,
    required this.getMovieRecommendations,
    required this.saveWatchlist,
    required this.removeWatchlist,
    required this.getWatchListStatus,
  }) : super(MovieDetailEmpty()) {
    on<FetchMovieDetails>((event, emit) async {
      emit(MovieDetailLoading());
      final result = await getMovieDetail.execute(event.id);

      result.fold(
        (failure) {
          emit(MovieDetailError(failure.message));
        },
        (data) {
          emit(MovieDetailHasData(data));
        },
      );
    });

    on<FetchMovieRecommendations>((event, emit) async {
      emit(MovieRecommendationsLoading());
      final result = await getMovieRecommendations.execute(event.id);

      result.fold(
        (failure) {
          emit(MovieRecommendationsError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(MovieRecommendationsEmpty());
          } else {
            emit(MovieRecommendationsHasData(data));
          }
        },
      );
    });

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
  }
}
