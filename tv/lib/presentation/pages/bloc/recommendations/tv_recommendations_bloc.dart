import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:equatable/equatable.dart';
import 'package:tv/domain/usecases/get_tv_recommendations.dart';

part 'tv_recommendations_event.dart';

part 'tv_recommendations_state.dart';

class TvRecommendationsBloc
    extends Bloc<TvRecommendationsEvent, TvRecommendationsState> {
  final GetTvRecommendations getTvRecommendations;

  TvRecommendationsBloc({
    required this.getTvRecommendations,
  }) : super(TvRecommendationsEmpty()) {
    on<FetchTvRecommendations>((event, emit) async {
      emit(TvRecommendationsLoading());
      final result = await getTvRecommendations.execute(event.id);

      result.fold(
        (failure) {
          emit(TvRecommendationsError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(TvRecommendationsEmpty());
          } else {
            emit(TvRecommendationsHasData(data));
          }
        },
      );
    });
  }
}
