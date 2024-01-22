import 'package:core/core.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:core/domain/usecases/tv/get_watchlist_tvs.dart';
import 'package:flutter/foundation.dart';

class WatchlistTvNotifier extends ChangeNotifier {
  var _watchlistTvs = <Tv>[];
  List<Tv> get watchlistTvs => _watchlistTvs;

  var _watchlistState = RequestState.Empty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  WatchlistTvNotifier({required this.getWatchlistTvs});

  final GetWatchlistTvs getWatchlistTvs;

  Future<void> fetchWatchlistTvs() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTvs.execute();
    result.fold(
          (Failure failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
          (tvsData) {
        _watchlistState = RequestState.Loaded;
        _watchlistTvs = tvsData;
        notifyListeners();
      },
    );
  }
}