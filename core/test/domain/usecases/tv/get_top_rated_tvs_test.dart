import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:core/domain/usecases/tv/get_top_rated_tvs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/tv/test_helper.mocks.dart';

void main() {
  late GetTopRatedTvs usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTopRatedTvs(mockTvRepository);
  });

  final tTvs = <Tv>[];

  test('should get list of tvs from the repository', () async {
    // arrange
    when(mockTvRepository.getTopRatedTvs())
        .thenAnswer((_) async => Right(tTvs));

    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTvs));
  });
}