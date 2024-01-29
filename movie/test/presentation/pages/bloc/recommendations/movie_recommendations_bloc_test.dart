import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/usecases/get_movie_recommendations.dart';
import 'package:movie/presentation/pages/bloc/recommendations/movie_recommendations_bloc.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movie_recommendations_bloc_test.mocks.dart';

@GenerateMocks([GetMovieRecommendations])
void main() {
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MovieRecommendationsBloc topRatedMoviesBloc;

  setUp(() {
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    topRatedMoviesBloc = MovieRecommendationsBloc(getMovieRecommendations: mockGetMovieRecommendations);
  });

  const tId = 1;

  test('initial state should be empty', () {
    expect(topRatedMoviesBloc.state, MovieRecommendationsEmpty());
  });

  blocTest(
    'should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetMovieRecommendations.execute(tId)).thenAnswer((_) async => Right(testMovieList));
      return topRatedMoviesBloc;
    },
    act: (bloc) => bloc.add(FetchMovieRecommendations(tId)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      MovieRecommendationsLoading(),
      MovieRecommendationsHasData(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetMovieRecommendations.execute(tId));
    },
  );

  blocTest(
    'should emit [Loading, Empty] when data is empty',
    build: () {
      when(mockGetMovieRecommendations.execute(tId)).thenAnswer((_) async => const Right([]));
      return topRatedMoviesBloc;
    },
    act: (bloc) => bloc.add(FetchMovieRecommendations(tId)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      MovieRecommendationsLoading(),
      MovieRecommendationsEmpty(),
    ],
    verify: (bloc) {
      verify(mockGetMovieRecommendations.execute(tId));
    },
  );

  blocTest(
    'should emit [Loading, Error] when get recommended movies returns error',
    build: () {
      when(mockGetMovieRecommendations.execute(tId)).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return topRatedMoviesBloc;
    },
    act: (bloc) => bloc.add(FetchMovieRecommendations(tId)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      MovieRecommendationsLoading(),
      MovieRecommendationsError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetMovieRecommendations.execute(tId));
    },
  );
}
