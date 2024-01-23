import 'package:core/core.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:tv/domain/usecases/get_on_the_air_tvs.dart';
import 'package:flutter/foundation.dart';

class OnTheAirTvsNotifier extends ChangeNotifier {
  final GetOnTheAirTvs getOnTheAirTvs;

  OnTheAirTvsNotifier(this.getOnTheAirTvs);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Tv> _tvs = [];
  List<Tv> get tvs => _tvs;

  String _message = '';
  String get message => _message;

  Future<void> fetchOnTheAirTvs() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getOnTheAirTvs.execute();

    result.fold(
          (Failure failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
          (tvsData) {
        _tvs = tvsData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
