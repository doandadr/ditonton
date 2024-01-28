import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/domain/usecases/get_popular_tvs.dart';
import 'package:tv/presentation/pages/bloc/popular/popular_tvs_bloc.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'popular_tvs_bloc_test.mocks.dart';

@GenerateMocks([GetPopularTvs])
void main() {
  late MockGetPopularTvs mockGetPopularTvs;
  late PopularTvsBloc popularTvsBloc;

  setUp(() {
    mockGetPopularTvs = MockGetPopularTvs();
    popularTvsBloc = PopularTvsBloc(mockGetPopularTvs);
  });

  test('initial state should be empty', () {
    expect(popularTvsBloc.state, PopularTvsEmpty());
  });

  blocTest<PopularTvsBloc, PopularTvsState>(
      'should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetPopularTvs.execute())
            .thenAnswer((_) async => Right(testTvList));
        return popularTvsBloc;
      },
      act: (bloc) => bloc.add(FetchPopularTvs()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
            PopularTvsLoading(),
            PopularTvsHasData(testTvList),
          ],
      verify: (bloc) {
        verify(mockGetPopularTvs.execute());
      });

  blocTest<PopularTvsBloc, PopularTvsState>(
      'should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetPopularTvs.execute())
            .thenAnswer((_) async => Right(testTvList));
        return popularTvsBloc;
      },
      act: (bloc) => bloc.add(FetchPopularTvs()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
            PopularTvsLoading(),
            PopularTvsHasData(testTvList),
          ],
      verify: (bloc) {
        verify(mockGetPopularTvs.execute());
      });

  blocTest<PopularTvsBloc, PopularTvsState>(
      'should emit [Loading, Empty] when data is empty',
      build: () {
        when(mockGetPopularTvs.execute())
            .thenAnswer((_) async => const Right([]));
        return popularTvsBloc;
      },
      act: (bloc) => bloc.add(FetchPopularTvs()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
            PopularTvsLoading(),
            PopularTvsEmpty(),
          ],
      verify: (bloc) {
        verify(mockGetPopularTvs.execute());
      });

  blocTest<PopularTvsBloc, PopularTvsState>(
      'should emit [Loading, Error] when get popular tvs returns error',
      build: () {
        when(mockGetPopularTvs.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return popularTvsBloc;
      },
      act: (bloc) => bloc.add(FetchPopularTvs()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
            PopularTvsLoading(),
            PopularTvsError('Server Failure'),
          ],
      verify: (bloc) {
        verify(mockGetPopularTvs.execute());
      });
}
