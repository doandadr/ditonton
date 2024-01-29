import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:equatable/equatable.dart';
import 'package:tv/domain/usecases/get_popular_tvs.dart';

part 'popular_tvs_event.dart';
part 'popular_tvs_state.dart';

class PopularTvsBloc extends Bloc<PopularTvsEvent, PopularTvsState> {
  final GetPopularTvs _getPopularTvs;
  PopularTvsBloc(this._getPopularTvs) : super(PopularTvsEmpty()) {
    on<FetchPopularTvs>(
        (event, emit) async {
          emit(PopularTvsLoading());
          final result = await _getPopularTvs.execute();

          result.fold(
              (failure) {
                emit(PopularTvsError(failure.message))
                    ;

              },
              (data) {
                if (data.isEmpty) {
                  emit(PopularTvsEmpty());
                } else {
                  emit(PopularTvsHasData(data));
                }
              }
          );
        }
    );
  }
}
