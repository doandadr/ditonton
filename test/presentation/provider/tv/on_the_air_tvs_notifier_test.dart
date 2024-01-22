import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_on_the_air_tvs.dart';
import 'package:ditonton/presentation/provider/tv/on_the_air_tvs_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'on_the_air_tvs_notifier_test.mocks.dart';


@GenerateMocks([GetOnTheAirTvs])
void main() {
  late MockGetOnTheAirTvs mockGetOnTheAirTvs;
  late OnTheAirTvsNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetOnTheAirTvs = MockGetOnTheAirTvs();
    notifier = OnTheAirTvsNotifier(mockGetOnTheAirTvs)
      ..addListener(() {
        listenerCallCount++;
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

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetOnTheAirTvs.execute())
        .thenAnswer((_) async => Right(tTvList));
    // act
    notifier.fetchOnTheAirTvs();
    // assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change tvs data when data is gotten successfully', () async {
    // arrange
    when(mockGetOnTheAirTvs.execute())
        .thenAnswer((_) async => Right(tTvList));
    // act
    await notifier.fetchOnTheAirTvs();
    // assert
    expect(notifier.state, RequestState.Loaded);
    expect(notifier.tvs, tTvList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetOnTheAirTvs.execute())
        .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchOnTheAirTvs();
    // assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}