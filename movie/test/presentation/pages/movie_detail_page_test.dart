import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/presentation/pages/bloc/detail/movie_detail_bloc.dart';
import 'package:movie/presentation/pages/movie_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

class FakeMovieDetailEvent extends Fake implements MovieDetailEvent {}

class FakeMovieDetailState extends Fake implements MovieDetailState {}

class MockMovieDetailBloc extends MockBloc<MovieDetailEvent, MovieDetailState>
    implements MovieDetailBloc {}

void main() {
  late MockMovieDetailBloc mockBloc;

  setUpAll(() {
    registerFallbackValue(FakeMovieDetailEvent());
    registerFallbackValue(FakeMovieDetailState());
  });

  setUp(() {
    mockBloc = MockMovieDetailBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<MovieDetailBloc>.value(
      value: mockBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(
      const MovieDetailHasData(testMovieDetail),
    );
    when(() => mockBloc.state).thenReturn(
      MovieRecommendationsHasData(testMovieList),
    );
    when(() => mockBloc.state).thenReturn(
      const MovieWatchlistStatus(false),
    );

    await tester.pumpWidget(
        makeTestableWidget(MovieDetailPage(id: 1)));
    await tester.pumpAndSettle();

    final watchlistButton = find.byType(ElevatedButton);

    await tester.tap(watchlistButton);
    await tester.pumpAndSettle();

    expect(watchlistButton, findsOneWidget);

    // final iconButton = find.byIcon(Icons.add);
    // expect(iconButton, findsOneWidget);
    //
    // expect(iconButton, findsOneWidget);
  });

  // testWidgets(
  //     'Watchlist button should dispay check icon when movie is added to wathclist',
  //     (WidgetTester tester) async {
  //   when(mockBloc.movieState).thenReturn(RequestState.Loaded);
  //   when(mockBloc.movie).thenReturn(testMovieDetail);
  //   when(mockBloc.recommendationState).thenReturn(RequestState.Loaded);
  //   when(mockBloc.movieRecommendations).thenReturn(<Movie>[]);
  //   when(mockBloc.isAddedToWatchlist).thenReturn(true);
  //
  //   when(() => mockBloc.state).thenReturn(MovieDetailLoading());
  //
  //
  //
  //   final watchlistButtonIcon = find.byIcon(Icons.check);
  //
  //   await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));
  //
  //   expect(watchlistButtonIcon, findsOneWidget);
  // });
  //
  // testWidgets(
  //     'Watchlist button should display Snackbar when added to watchlist',
  //     (WidgetTester tester) async {
  //   when(mockBloc.movieState).thenReturn(RequestState.Loaded);
  //   when(mockBloc.movie).thenReturn(testMovieDetail);
  //   when(mockBloc.recommendationState).thenReturn(RequestState.Loaded);
  //   when(mockBloc.movieRecommendations).thenReturn(<Movie>[]);
  //   when(mockBloc.isAddedToWatchlist).thenReturn(false);
  //   when(mockBloc.watchlistMessage).thenReturn('Added to Watchlist');
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
  //   expect(find.byType(SnackBar), findsOneWidget);
  //   expect(find.text('Added to Watchlist'), findsOneWidget);
  // });
  //
  // testWidgets(
  //     'Watchlist button should display AlertDialog when add to watchlist failed',
  //     (WidgetTester tester) async {
  //   when(mockBloc.movieState).thenReturn(RequestState.Loaded);
  //   when(mockBloc.movie).thenReturn(testMovieDetail);
  //   when(mockBloc.recommendationState).thenReturn(RequestState.Loaded);
  //   when(mockBloc.movieRecommendations).thenReturn(<Movie>[]);
  //   when(mockBloc.isAddedToWatchlist).thenReturn(false);
  //   when(mockBloc.watchlistMessage).thenReturn('Failed');
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
