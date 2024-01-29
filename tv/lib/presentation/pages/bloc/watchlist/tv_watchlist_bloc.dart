import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:core/domain/entities/tv/tv_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:tv/domain/usecases/get_watchlist_tvs.dart';
import 'package:tv/domain/usecases/get_watchlist_status.dart';
import 'package:tv/domain/usecases/remove_watchlist.dart';
import 'package:tv/domain/usecases/save_watchlist.dart';

part 'tv_watchlist_event.dart';

part 'tv_watchlist_state.dart';

class TvWatchlistBloc
    extends Bloc<TvWatchlistEvent, TvWatchlistState> {
  static const String watchlistAddSuccessMessage = 'Added to Watchlist';
  static const String watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;
  final GetWatchlistStatus getWatchListStatus;
  final GetWatchlistTvs getWatchlistTvs;

  TvWatchlistBloc({
    required this.saveWatchlist,
    required this.removeWatchlist,
    required this.getWatchListStatus,
    required this.getWatchlistTvs,
  }) : super(TvWatchlistEmpty()) {
    on<FetchTvWatchlistStatus>((event, emit) async {
      emit(TvWatchlistLoading());
      final isAddedToWatchlist = await getWatchListStatus.execute(event.id);
      emit(TvWatchlistStatus(isAddedToWatchlist));
    });

    on<SaveTvWatchlist>((event, emit) async {
      emit(TvWatchlistLoading());
      final result = await saveWatchlist.execute(event.tv);

      result.fold((failure) {
        emit(TvWatchlistError(failure.message));
      }, (data) {
        emit(TvWatchlistMessage(data));
      });
    });

    on<RemoveTvWatchlist>((event, emit) async {
      emit(TvWatchlistLoading());
      final result = await removeWatchlist.execute(event.tv);

      result.fold(
        (failure) {
          emit(TvWatchlistError(failure.message));
        },
        (data) {
          emit(TvWatchlistMessage(data));
        },
      );
    });

    on<FetchWatchlistTvs>((event, emit) async {
      emit(TvWatchlistLoading());
      final result = await getWatchlistTvs.execute();

      result.fold((failure) {
        emit(TvWatchlistError(failure.message));
      }, (data) {
        if (data.isEmpty) {
          emit(TvWatchlistEmpty());
        } else {
          emit(TvWatchlistHasData(data));
        }
      });
    });
  }
}
