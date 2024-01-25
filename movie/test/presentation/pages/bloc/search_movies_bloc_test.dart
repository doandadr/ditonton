import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/data/models/movie/movie_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/usecases/search_movies.dart';
import 'package:movie/presentation/pages/bloc/search_movies_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../provider/movie_search_notifier_test.mocks.dart';

@GenerateMocks([SearchMovies])
void main() {
  late SearchMoviesBloc searchBloc;
  late MockSearchMovies mockSearchMovies;

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    searchBloc = SearchMoviesBloc(mockSearchMovies);
  });

  test('initial state should be empty', () {
    expect(searchBloc.state, SearchEmpty());
  });

  final testQuery = 'spiderman';

  blocTest<SearchMoviesBloc, SearchMoviesState>(
    'should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchMovies.execute(testQuery))
          .thenAnswer((_) async => Right(testMovieList));
      return searchBloc;
    },
    act: (bloc) => bloc.add(OnQueryChanged(testQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchLoading(),
      SearchHasData(testMovieList),
    ],
    verify: (bloc) {
      verify(mockSearchMovies.execute(testQuery));
    },
  );

  blocTest<SearchMoviesBloc, SearchMoviesState>(
    'should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockSearchMovies.execute(testQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return searchBloc;
    },
    act: (bloc) => bloc.add(OnQueryChanged(testQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchLoading(),
      SearchError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockSearchMovies.execute(testQuery));
    },
  );
}
