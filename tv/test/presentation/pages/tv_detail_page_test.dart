import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv/presentation/pages/bloc/detail/tv_detail_bloc.dart';
import 'package:tv/presentation/pages/bloc/recommendations/tv_recommendations_bloc.dart';
import 'package:tv/presentation/pages/bloc/watchlist/tv_watchlist_bloc.dart';
import 'package:tv/presentation/pages/tv_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

class FakeTvDetailEvent extends Fake implements TvDetailEvent {}

class FakeTvDetailState extends Fake implements TvDetailState {}

class MockTvDetailBloc extends MockBloc<TvDetailEvent, TvDetailState>
    implements TvDetailBloc {}

class FakeTvRecommendationsEvent extends Fake
    implements TvRecommendationsEvent {}

class FakeTvRecommendationsState extends Fake
    implements TvRecommendationsState {}

class MockTvRecommendationsBloc
    extends MockBloc<TvRecommendationsEvent, TvRecommendationsState>
    implements TvRecommendationsBloc {}

class FakeTvWatchlistEvent extends Fake implements TvWatchlistEvent {}

class FakeTvWatchlistState extends Fake implements TvWatchlistState {}

class MockTvWatchlistBloc extends MockBloc<TvWatchlistEvent, TvWatchlistState>
    implements TvWatchlistBloc {}

void main() {
  late MockTvDetailBloc mockTvDetailBloc;
  late MockTvRecommendationsBloc mockTvRecommendationsBloc;
  late MockTvWatchlistBloc mockTvWatchlistBloc;

  setUpAll(() {
    registerFallbackValue(FakeTvDetailEvent());
    registerFallbackValue(FakeTvDetailState());
    registerFallbackValue(FakeTvRecommendationsEvent());
    registerFallbackValue(FakeTvRecommendationsState());
    registerFallbackValue(FakeTvWatchlistEvent());
    registerFallbackValue(FakeTvWatchlistState());
  });

  setUp(() {
    mockTvDetailBloc = MockTvDetailBloc();
    mockTvRecommendationsBloc = MockTvRecommendationsBloc();
    mockTvWatchlistBloc = MockTvWatchlistBloc();
  });

  Widget makeTestableWidget(Widget body) {
    // return BlocProvider<TvDetailBloc>.value(
    //   value: mockTvDetailBloc,
    //   child: MaterialApp(
    //     home: body,
    //   ),
    // );
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvDetailBloc>(
          create: (_) => mockTvDetailBloc,
        ),
        BlocProvider<TvRecommendationsBloc>(
          create: (_) => mockTvRecommendationsBloc,
        ),
        BlocProvider<TvWatchlistBloc>(
          create: (_) => mockTvWatchlistBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when tv not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockTvDetailBloc.state).thenReturn(
      TvDetailHasData(testTvDetail),
    );
    when(() => mockTvRecommendationsBloc.state).thenReturn(
      TvRecommendationsHasData(testTvList),
    );
    when(() => mockTvWatchlistBloc.state).thenReturn(
      const TvWatchlistStatus(false),
    );

    final tId = testTvDetail.id;

    await tester.pumpWidget(makeTestableWidget(TvDetailPage(id: tId)));
    await tester.pump();

    final watchlistButton = find.byType(ElevatedButton);

    expect(watchlistButton, findsOneWidget);

    final iconButton = find.byIcon(Icons.add);
    expect(iconButton, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display check icon when tv is added to watchlist',
      (WidgetTester tester) async {
    when(() => mockTvDetailBloc.state).thenReturn(
      TvDetailHasData(testTvDetail),
    );
    when(() => mockTvRecommendationsBloc.state).thenReturn(
      TvRecommendationsHasData(testTvList),
    );
    when(() => mockTvWatchlistBloc.state).thenReturn(
      const TvWatchlistStatus(true),
    );

    final tId = testTvDetail.id;

    await tester.pumpWidget(makeTestableWidget(TvDetailPage(id: tId)));
    await tester.pump();

    final watchlistButton = find.byType(ElevatedButton);

    expect(watchlistButton, findsOneWidget);

    final iconButton = find.byIcon(Icons.check);
    expect(iconButton, findsOneWidget);
  });
}
