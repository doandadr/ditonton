import 'package:core/domain/entities/tv/tv.dart';
import 'package:core/domain/entities/tv/tv_detail.dart';
import 'package:tv/domain/usecases/tv/get_tv_detail.dart';
import 'package:tv/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:core/core.dart';
import 'package:tv/domain/usecases/tv/get_watchlist_status.dart';
import 'package:tv/domain/usecases/tv/remove_watchlist.dart';
import 'package:tv/domain/usecases/tv/save_watchlist.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TvDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetTvDetail getTvDetail;
  final GetTvRecommendations getTvRecommendations;
  final GetWatchlistStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  TvDetailNotifier({
    required this.getTvDetail,
    required this.getTvRecommendations,
    required this.getWatchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  });

  late TvDetail _tv;
  TvDetail get tv => _tv;

  RequestState _tvState = RequestState.Empty;
  RequestState get tvState => _tvState;

  List<Tv> _tvRecommendations = [];
  List<Tv> get tvRecommendations => _tvRecommendations;

  RequestState _recommendationState = RequestState.Empty;
  RequestState get recommendationState => _recommendationState;

  String _message = '';
  String get message => _message;

  bool _isAddedtoWatchlist = false;
  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  Future<void> fetchTvDetail(int id) async {
    _tvState = RequestState.Loading;
    notifyListeners();
    final detailResult = await getTvDetail.execute(id);
    final recommendationResult = await getTvRecommendations.execute(id);
    detailResult.fold(
          (Failure failure) {
        _tvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
          (tv) {
        _recommendationState = RequestState.Loading;
        _tv = tv;
        notifyListeners();
        recommendationResult.fold(
              (Failure failure) {
            _recommendationState = RequestState.Error;
            _message = failure.message;
          },
              (tvs) {
            _recommendationState = RequestState.Loaded;
            _tvRecommendations = tvs;
          },
        );
        _tvState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  Future<void> addWatchlist(TvDetail tv) async {
    final result = await saveWatchlist.execute(tv);

    await result.fold(
          (Failure failure) async {
        _watchlistMessage = failure.message;
      },
          (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(tv.id);
  }

  Future<void> removeFromWatchlist(TvDetail tv) async {
    final result = await removeWatchlist.execute(tv);

    await result.fold(
          (Failure failure) async {
        _watchlistMessage = failure.message;
      },
          (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(tv.id);
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await getWatchListStatus.execute(id);
    _isAddedtoWatchlist = result;
    notifyListeners();
  }
}
