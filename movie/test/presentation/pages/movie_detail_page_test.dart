import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/presentation/pages/bloc/detail/movie_detail_bloc.dart';
import 'package:movie/presentation/pages/bloc/recommendations/movie_recommendations_bloc.dart';
import 'package:movie/presentation/pages/bloc/watchlist/movie_watchlist_bloc.dart';
import 'package:movie/presentation/pages/movie_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

class FakeMovieDetailEvent extends Fake implements MovieDetailEvent {}

class FakeMovieDetailState extends Fake implements MovieDetailState {}

class MockMovieDetailBloc extends MockBloc<MovieDetailEvent, MovieDetailState>
    implements MovieDetailBloc {}

class FakeMovieRecommendationsEvent extends Fake
    implements MovieRecommendationsEvent {}

class FakeMovieRecommendationsState extends Fake
    implements MovieRecommendationsState {}

class MockMovieRecommendationsBloc
    extends MockBloc<MovieRecommendationsEvent, MovieRecommendationsState>
    implements MovieRecommendationsBloc {}

class FakeMovieWatchlistEvent extends Fake implements MovieWatchlistEvent {}

class FakeMovieWatchlistState extends Fake implements MovieWatchlistState {}

class MockMovieWatchlistBloc
    extends MockBloc<MovieWatchlistEvent, MovieWatchlistState>
    implements MovieWatchlistBloc {}

void main() {
  late MockMovieDetailBloc mockMovieDetailBloc;
  late MockMovieRecommendationsBloc mockMovieRecommendationsBloc;
  late MockMovieWatchlistBloc mockMovieWatchlistBloc;

  setUpAll(() {
    registerFallbackValue(FakeMovieDetailEvent());
    registerFallbackValue(FakeMovieDetailState());
    registerFallbackValue(FakeMovieRecommendationsEvent());
    registerFallbackValue(FakeMovieRecommendationsState());
    registerFallbackValue(FakeMovieWatchlistEvent());
    registerFallbackValue(FakeMovieWatchlistState());
  });

  setUp(() {
    mockMovieDetailBloc = MockMovieDetailBloc();
    mockMovieRecommendationsBloc = MockMovieRecommendationsBloc();
    mockMovieWatchlistBloc = MockMovieWatchlistBloc();
  });

  Widget makeTestableWidget(Widget body) {
    // return BlocProvider<MovieDetailBloc>.value(
    //   value: mockMovieDetailBloc,
    //   child: MaterialApp(
    //     home: body,
    //   ),
    // );
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailBloc>(
          create: (_) => mockMovieDetailBloc,
        ),
        BlocProvider<MovieRecommendationsBloc>(
          create: (_) => mockMovieRecommendationsBloc,
        ),
        BlocProvider<MovieWatchlistBloc>(
          create: (_) => mockMovieWatchlistBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state).thenReturn(
      const MovieDetailHasData(testMovieDetail),
    );
    when(() => mockMovieRecommendationsBloc.state).thenReturn(
      MovieRecommendationsHasData(testMovieList),
    );
    when(() => mockMovieWatchlistBloc.state).thenReturn(
      const MovieWatchlistStatus(false),
    );

    final tId = testMovieDetail.id;

    await tester.pumpWidget(makeTestableWidget(MovieDetailPage(id: tId)));
    await tester.pump();

    final watchlistButton = find.byType(ElevatedButton);

    expect(watchlistButton, findsOneWidget);

    final iconButton = find.byIcon(Icons.add);
    expect(iconButton, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display check icon when movie is added to watchlist',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state).thenReturn(
      const MovieDetailHasData(testMovieDetail),
    );
    when(() => mockMovieRecommendationsBloc.state).thenReturn(
      MovieRecommendationsHasData(testMovieList),
    );
    when(() => mockMovieWatchlistBloc.state).thenReturn(
      const MovieWatchlistStatus(true),
    );

    final tId = testMovieDetail.id;

    await tester.pumpWidget(makeTestableWidget(MovieDetailPage(id: tId)));
    await tester.pump();

    final watchlistButton = find.byType(ElevatedButton);

    expect(watchlistButton, findsOneWidget);

    final iconButton = find.byIcon(Icons.check);
    expect(iconButton, findsOneWidget);
  });


  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state).thenReturn(
      const MovieDetailHasData(testMovieDetail),
    );
    when(() => mockMovieRecommendationsBloc.state).thenReturn(
      MovieRecommendationsHasData(testMovieList),
    );
    when(() => mockMovieWatchlistBloc.state).thenReturn(
      const MovieWatchlistStatus(false),
    );

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    final watchlistButton = find.byType(ElevatedButton);

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);

    when(() => mockMovieWatchlistBloc.state).thenReturn(
      const MovieWatchlistMessage(MovieWatchlistBloc.watchlistAddSuccessMessage)
    );

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text(MovieWatchlistBloc.watchlistAddSuccessMessage),
        findsOneWidget);
  });

  // testWidgets(
  //     'Watchlist button should display AlertDialog when add to watchlist failed',
  //     (WidgetTester tester) async {
  //   when(mockMovieDetailBloc.movieState).thenReturn(RequestState.Loaded);
  //   when(mockMovieDetailBloc.movie).thenReturn(testMovieDetail);
  //   when(mockMovieDetailBloc.recommendationState).thenReturn(RequestState.Loaded);
  //   when(mockMovieDetailBloc.movieRecommendations).thenReturn(<Movie>[]);
  //   when(mockMovieDetailBloc.isAddedToWatchlist).thenReturn(false);
  //   when(mockMovieDetailBloc.watchlistMessage).thenReturn('Failed');
  //
  //   final watchlistButton = find.byType(ElevatedButton);
  //
  //   await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));
  //
  //   expect(find.byIcon(Icons.add), findsOneWidget);
  //
  //   await tester.tap(watchlistButton);
  //   await tester.pump();
  //
  //   expect(find.byType(AlertDialog), findsOneWidget);
  //   expect(find.text('Failed'), findsOneWidget);
  // });
}
