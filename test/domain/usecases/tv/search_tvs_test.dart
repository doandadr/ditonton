import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv/search_tvs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv/dummy_objects.dart';
import '../../../helpers/tv/test_helper.mocks.dart';

void main() {
  late SearchTvs usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = SearchTvs(mockTvRepository);
  });

  final tQuery = "query";

  test('should get tv detail from the repository', () async {
    // arrange
    when(mockTvRepository.searchTvs(tQuery))
        .thenAnswer((_) async => Right(testTvList));
    // act
    final result = await usecase.execute(tQuery);
    // assert
    expect(result, Right(testTvList));
  });
}
