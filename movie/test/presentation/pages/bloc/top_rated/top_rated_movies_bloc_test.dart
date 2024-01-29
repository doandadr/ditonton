import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/usecases/get_top_rated_movies.dart';
import 'package:movie/presentation/pages/bloc/top_rated/top_rated_movies_bloc.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'top_rated_movies_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late TopRatedMoviesBloc topRatedMoviesBloc;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    topRatedMoviesBloc = TopRatedMoviesBloc(mockGetTopRatedMovies);
  });

  test('initial state should be empty', () {
    expect(topRatedMoviesBloc.state, TopRatedMoviesEmpty());
  });

  blocTest(
    'should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetTopRatedMovies.execute()).thenAnswer((_) async => Right(testMovieList));
      return topRatedMoviesBloc;
    },
    act: (bloc) => bloc.add(FetchTopRatedMovies()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TopRatedMoviesLoading(),
      TopRatedMoviesHasData(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedMovies.execute());
    },
  );

  blocTest(
    'should emit [Loading, Empty] when data is empty',
    build: () {
      when(mockGetTopRatedMovies.execute()).thenAnswer((_) async => const Right([]));
      return topRatedMoviesBloc;
    },
    act: (bloc) => bloc.add(FetchTopRatedMovies()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TopRatedMoviesLoading(),
      TopRatedMoviesEmpty(),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedMovies.execute());
    },
  );

  blocTest(
    'should emit [Loading, Error] when get top rated movies returns error',
    build: () {
      when(mockGetTopRatedMovies.execute()).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return topRatedMoviesBloc;
    },
    act: (bloc) => bloc.add(FetchTopRatedMovies()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TopRatedMoviesLoading(),
      const TopRatedMoviesError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedMovies.execute());
    },
  );
}
