import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/domain/usecases/search_tvs.dart';
import 'package:tv/presentation/pages/bloc/search_tvs_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'search_tvs_bloc_test.mocks.dart';

@GenerateMocks([SearchTvs])
void main() {
  late SearchTvsBloc searchBloc;
  late MockSearchTvs mockSearchTvs;

  setUp(() {
    mockSearchTvs = MockSearchTvs();
    searchBloc = SearchTvsBloc(mockSearchTvs);
  });

  test('initial state should be empty', () {
    expect(searchBloc.state, SearchEmpty());
  });

  final testQuery = 'game of thrones';

  blocTest<SearchTvsBloc, SearchTvsState>(
    'should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchTvs.execute(testQuery))
          .thenAnswer((_) async => Right(testTvList));
      return searchBloc;
    },
    act: (bloc) => bloc.add(OnQueryChanged(testQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchLoading(),
      SearchHasData(testTvList),
    ],
    verify: (bloc) {
      verify(mockSearchTvs.execute(testQuery));
    },
  );

  blocTest<SearchTvsBloc, SearchTvsState>(
    'should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockSearchTvs.execute(testQuery))
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
      verify(mockSearchTvs.execute(testQuery));
    },
  );
}
