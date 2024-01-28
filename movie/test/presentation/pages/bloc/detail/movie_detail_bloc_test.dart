import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/usecases/get_movie_detail.dart';
import 'package:movie/presentation/pages/bloc/detail/movie_detail_bloc.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movie_detail_bloc_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
])
void main() {
  late MovieDetailBloc movieDetailBloc;
  late MockGetMovieDetail mockGetMovieDetail;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    movieDetailBloc = MovieDetailBloc(
      getMovieDetail: mockGetMovieDetail,
    );
  });

  const int testId = 1;

  test('initial state should be empty', () {
    expect(movieDetailBloc.state, MovieDetailEmpty());
  });

  blocTest<MovieDetailBloc, MovieDetailState>(
    'should emit [DetailLoading, DetailHasData] when data is gotten successfully',
    build: () {
      when(mockGetMovieDetail.execute(testId))
          .thenAnswer((_) async => const Right(testMovieDetail));
      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(const FetchMovieDetails(testId)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      MovieDetailLoading(),
      const MovieDetailHasData(testMovieDetail),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetail.execute(testId));
    },
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'should emit [DetailLoading, DetailError] when get movie detail returns error',
    build: () {
      when(mockGetMovieDetail.execute(testId))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(const FetchMovieDetails(testId)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      MovieDetailLoading(),
      const MovieDetailError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetail.execute(testId));
    },
  );
}
