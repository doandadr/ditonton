import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/domain/usecases/get_top_rated_tvs.dart';
import 'package:tv/presentation/pages/bloc/top_rated/top_rated_tvs_bloc.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'top_rated_tvs_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedTvs])
void main() {}

// void main() {
//   late MockGetTopRatedTvs mockGetTopRatedTvs;
//   late TopRatedTvsBloc topRatedTvsBloc;
//
//   setUp(() {
//     mockGetTopRatedTvs = MockGetTopRatedTvs();
//     topRatedTvsBloc = TopRatedTvsBloc(mockGetTopRatedTvs);
//   });
//
//   test('initial state should be empty', () {
//     expect(topRatedTvsBloc.state, TopRatedTvsEmpty());
//   });
//
//   blocTest(
//     'should emit [Loading, HasData] when data is gotten successfully',
//     build: () {
//       when(mockGetTopRatedTvs.execute()).thenAnswer((_) async => Right(testTvList));
//       return topRatedTvsBloc;
//     },
//     act: (bloc) => bloc.add(FetchTopRatedTvs()),
//     wait: const Duration(milliseconds: 100),
//     expect: () => [
//       TopRatedTvsLoading(),
//       TopRatedTvsHasData(testTvList),
//     ],
//     verify: (bloc) {
//       verify(mockGetTopRatedTvs.execute());
//     },
//   );
//
//   blocTest(
//     'should emit [Loading, Empty] when data is empty',
//     build: () {
//       when(mockGetTopRatedTvs.execute()).thenAnswer((_) async => const Right([]));
//       return topRatedTvsBloc;
//     },
//     act: (bloc) => bloc.add(FetchTopRatedTvs()),
//     wait: const Duration(milliseconds: 100),
//     expect: () => [
//       TopRatedTvsLoading(),
//       TopRatedTvsEmpty(),
//     ],
//     verify: (bloc) {
//       verify(mockGetTopRatedTvs.execute());
//     },
//   );
//
//   blocTest(
//     'should emit [Loading, Error] when get top rated tvs returns error',
//     build: () {
//       when(mockGetTopRatedTvs.execute()).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
//       return topRatedTvsBloc;
//     },
//     act: (bloc) => bloc.add(FetchTopRatedTvs()),
//     wait: const Duration(milliseconds: 100),
//     expect: () => [
//       TopRatedTvsLoading(),
//       TopRatedTvsError('Server Failure'),
//     ],
//     verify: (bloc) {
//       verify(mockGetTopRatedTvs.execute());
//     },
//   );
// }
