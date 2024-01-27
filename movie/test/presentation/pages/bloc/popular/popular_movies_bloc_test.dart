import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/usecases/get_popular_movies.dart';
import 'package:movie/presentation/pages/bloc/popular/popular_movies_bloc.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'popular_movies_bloc_test.mocks.dart';


@GenerateMocks([GetPopularMovies])
void main() {
  late MockGetPopularMovies mockGetPopularMovies;
  late PopularMoviesBloc popularMoviesBloc;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    popularMoviesBloc = PopularMoviesBloc(mockGetPopularMovies)
;  });

  test('initial state should be empty', () {
    expect(popularMoviesBloc.state, PopularMoviesEmpty())
;  });

  blocTest<PopularMoviesBloc, PopularMoviesState>(
    'should emit [Loading, Data] when data is gotten successfully',
    build: () {
      when(mockGetPopularMovies.execute()).thenAnswer((_) async => Right(testMovieList));
      return popularMoviesBloc;
    },
    act: (bloc) => bloc.add(FetchPopularMovies()),
    wait: const Duration(milliseconds: 100)
      ,
    expect: () => [
      PopularMoviesLoading(),
      PopularMoviesHasData(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetPopularMovies.execute());
    }
  );

  blocTest<PopularMoviesBloc, PopularMoviesState>(
      'should emit [Loading, Empty] when data is gotten successfully',
      build: () {
        when(mockGetPopularMovies.execute()).thenAnswer((_) async => Right(testMovieList));
        return popularMoviesBloc;
      },
      act: (bloc) => bloc.add(FetchPopularMovies()),
      wait: const Duration(milliseconds: 100)
      ,
      expect: () => [
        PopularMoviesLoading(),
        PopularMoviesHasData(testMovieList),
      ],
      verify: (bloc) {
        verify(mockGetPopularMovies.execute());
      }
  );

  blocTest<PopularMoviesBloc, PopularMoviesState>(
      'should emit [Loading, Empty] when data is empty',
      build: () {
        when(mockGetPopularMovies.execute()).thenAnswer((_) async => const Right([]));
        return popularMoviesBloc;
      },
      act: (bloc) => bloc.add(FetchPopularMovies()),
      wait: const Duration(milliseconds: 100)
      ,
      expect: () => [
        PopularMoviesLoading(),
        PopularMoviesEmpty(),
      ],
      verify: (bloc) {
        verify(mockGetPopularMovies.execute());
      }
  );

  blocTest<PopularMoviesBloc, PopularMoviesState>(
      'should emit [Loading, Error] when get popular movies returns error',
      build: () {
        when(mockGetPopularMovies.execute()).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        return popularMoviesBloc;
      },
      act: (bloc) => bloc.add(FetchPopularMovies()),
      wait: const Duration(milliseconds: 100)
      ,
      expect: () => [
        PopularMoviesLoading(),
        PopularMoviesError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetPopularMovies.execute());
      }
  );

}