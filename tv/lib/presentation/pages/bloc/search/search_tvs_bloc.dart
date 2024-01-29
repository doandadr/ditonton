
import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tv/domain/usecases/search_tvs.dart';

part 'search_tvs_event.dart';

part 'search_tvs_state.dart';

class SearchTvsBloc extends Bloc<SearchTvsEvent, SearchTvsState> {
  final SearchTvs _searchTvs;

  SearchTvsBloc(this._searchTvs) : super(SearchEmpty()) {
    on<OnQueryChanged>(
      (event, emit) async {
        final query = event.query;

        emit(SearchLoading());
        final result = await _searchTvs.execute(query);

        result.fold(
          (failure) {
            emit(SearchError(failure.message));
          },
          (data) {
            emit(SearchHasData(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
