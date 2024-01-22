import 'package:dartz/dartz.dart';
import '../../../../core/lib/utils/failure.dart';
import '../../../../core/lib/utils/state_enum.dart';
import 'package:ditonton/data/models/tv/tv_model.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/usecases/tv/search_tvs.dart';
import 'package:ditonton/presentation/provider/tv/tv_search_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_search_notifier_test.mocks.dart';

@GenerateMocks([SearchTvs])
void main() {
  late TvSearchNotifier provider;
  late MockSearchTvs mockSearchTvs;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockSearchTvs = MockSearchTvs();
    provider = TvSearchNotifier(searchTvs: mockSearchTvs)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tTv = Tv(
      adult: false,
      backdropPath: "/nQSaUQzYnSE9v4CXZiOkSNndaYu.jpg",
      genreIds: [10765, 18, 10759],
      id: 1399,
      originCountry: ["US"],
      originalLanguage: "en",
      originalName: "Game of Thrones",
      overview:
      "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
      popularity: 569.928,
      posterPath: "/1XS1oqL89opfnbLl8WnZY1O1uJx.jpg",
      firstAirDate: "2011-04-17",
      name: "Game of Thrones",
      voteAverage: 8.442,
      voteCount: 22490);
  final tTvList = <Tv>[tTv];
  final tQuery = 'game of thrones';

  group('search tvs', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockSearchTvs.execute(tQuery))
          .thenAnswer((_) async => Right(tTvList));
      // act
      provider.fetchTvSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Loading);
    });

    test('should change search result data when data is gotten successfully',
            () async {
          // arrange
          when(mockSearchTvs.execute(tQuery))
              .thenAnswer((_) async => Right(tTvList));
          // act
          await provider.fetchTvSearch(tQuery);
          // assert
          expect(provider.state, RequestState.Loaded);
          expect(provider.searchResult, tTvList);
          expect(listenerCallCount, 2);
        });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockSearchTvs.execute(tQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchTvSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
