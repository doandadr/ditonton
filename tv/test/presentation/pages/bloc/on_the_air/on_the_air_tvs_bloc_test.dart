import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/domain/usecases/get_on_the_air_tvs.dart';
import 'package:tv/presentation/pages/bloc/on_the_air/on_the_air_tvs_bloc.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'on_the_air_tvs_bloc_test.mocks.dart';

@GenerateMocks([GetOnTheAirTvs])
void main() {
  late OnTheAirTvsBloc onTheAirTvsBloc;
  late MockGetOnTheAirTvs mockGetOnTheAirTvs;

  setUp(() {
    mockGetOnTheAirTvs = MockGetOnTheAirTvs();
    onTheAirTvsBloc = OnTheAirTvsBloc(mockGetOnTheAirTvs);
  });

  test('initial state should be empty', () {
    expect(onTheAirTvsBloc.state, OnTheAirTvsEmpty());
  });

  blocTest<OnTheAirTvsBloc, OnTheAirTvsState>(
    'should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetOnTheAirTvs.execute())
          .thenAnswer((_) async => Right(testTvList));
      return onTheAirTvsBloc;
    },
    act: (bloc) => bloc.add(FetchOnTheAirTvs()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      OnTheAirTvsLoading(),
      OnTheAirTvsHasData(testTvList),
    ],
    verify: (bloc) => verify(mockGetOnTheAirTvs.execute()),
  );

  blocTest<OnTheAirTvsBloc, OnTheAirTvsState>(
    'should emit [Loading, Empty] when data is empty',
    build: () {
      when(mockGetOnTheAirTvs.execute())
          .thenAnswer((_) async => const Right([]));
      return onTheAirTvsBloc;
    },
    act: (bloc) => bloc.add(FetchOnTheAirTvs()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      OnTheAirTvsLoading(),
      OnTheAirTvsEmpty(),
    ],
    verify: (bloc) => verify(mockGetOnTheAirTvs.execute()),
  );

  blocTest<OnTheAirTvsBloc, OnTheAirTvsState>(
    'should emit [Loading, Error] when get now playing tvs is unsuccessful',
    build: () {
      when(mockGetOnTheAirTvs.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return onTheAirTvsBloc;
    },
    act: (bloc) => bloc.add(FetchOnTheAirTvs()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      OnTheAirTvsLoading(),
      const OnTheAirTvsError('Server Failure'),
    ],
    verify: (bloc) => verify(mockGetOnTheAirTvs.execute()),
  );
}
