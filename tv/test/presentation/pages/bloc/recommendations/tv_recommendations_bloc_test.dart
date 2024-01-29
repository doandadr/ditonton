import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/domain/usecases/get_tv_recommendations.dart';
import 'package:tv/presentation/pages/bloc/recommendations/tv_recommendations_bloc.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'tv_recommendations_bloc_test.mocks.dart';

@GenerateMocks([GetTvRecommendations])
void main() {
  late MockGetTvRecommendations mockGetTvRecommendations;
  late TvRecommendationsBloc topRatedTvsBloc;

  setUp(() {
    mockGetTvRecommendations = MockGetTvRecommendations();
    topRatedTvsBloc = TvRecommendationsBloc(getTvRecommendations: mockGetTvRecommendations);
  });

  const tId = 1;

  test('initial state should be empty', () {
    expect(topRatedTvsBloc.state, TvRecommendationsEmpty());
  });

  blocTest(
    'should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetTvRecommendations.execute(tId)).thenAnswer((_) async => Right(testTvList));
      return topRatedTvsBloc;
    },
    act: (bloc) => bloc.add(FetchTvRecommendations(tId)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TvRecommendationsLoading(),
      TvRecommendationsHasData(testTvList),
    ],
    verify: (bloc) {
      verify(mockGetTvRecommendations.execute(tId));
    },
  );

  blocTest(
    'should emit [Loading, Empty] when data is empty',
    build: () {
      when(mockGetTvRecommendations.execute(tId)).thenAnswer((_) async => const Right([]));
      return topRatedTvsBloc;
    },
    act: (bloc) => bloc.add(FetchTvRecommendations(tId)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TvRecommendationsLoading(),
      TvRecommendationsEmpty(),
    ],
    verify: (bloc) {
      verify(mockGetTvRecommendations.execute(tId));
    },
  );

  blocTest(
    'should emit [Loading, Error] when get recommended tvs returns error',
    build: () {
      when(mockGetTvRecommendations.execute(tId)).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return topRatedTvsBloc;
    },
    act: (bloc) => bloc.add(FetchTvRecommendations(tId)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TvRecommendationsLoading(),
      TvRecommendationsError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTvRecommendations.execute(tId));
    },
  );
}
