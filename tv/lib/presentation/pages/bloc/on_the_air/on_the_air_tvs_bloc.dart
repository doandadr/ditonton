import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:equatable/equatable.dart';
import 'package:tv/domain/usecases/get_on_the_air_tvs.dart';

part 'on_the_air_tvs_event.dart';

part 'on_the_air_tvs_state.dart';

class OnTheAirTvsBloc
    extends Bloc<OnTheAirTvsEvent, OnTheAirTvsState> {
  final GetOnTheAirTvs _getOnTheAirTvs;

  OnTheAirTvsBloc(this._getOnTheAirTvs)
      : super(OnTheAirTvsEmpty()) {
    on<FetchOnTheAirTvs>(
      (event, emit) async {
        emit(OnTheAirTvsLoading());
        final result = await _getOnTheAirTvs.execute();

        result.fold(
          (failure) {
            emit(OnTheAirTvsError(failure.message));
          },
          (data) {
            if (data.isEmpty) {
              emit(OnTheAirTvsEmpty());
            } else {
              emit(OnTheAirTvsHasData(data));
            }
          },
        );
      },
    );
  }
}
