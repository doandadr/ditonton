import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/pages/bloc/popular/popular_movies_bloc.dart';
import 'package:movie/presentation/pages/popular_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';
class MockPopularMoviesBloc extends MockBloc<PopularMoviesEvent, PopularMoviesState> implements PopularMoviesBloc {}

class FakePopularMoviesEvent extends Fake implements PopularMoviesEvent {
}

class FakePopularMoviesState extends Fake implements PopularMoviesState {}

void main() {
  late MockPopularMoviesBloc mockBloc;

  setUpAll(() {
    registerFallbackValue(FakePopularMoviesEvent());
    registerFallbackValue(FakePopularMoviesState());
  });

  setUp(() {
    mockBloc = MockPopularMoviesBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<PopularMoviesBloc>.value(
      value: mockBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(PopularMoviesLoading());

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final centerFinder = find.byType(Center);

        await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));

        expect(centerFinder, findsOneWidget);
        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(PopularMoviesHasData(testMovieList));

        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));

        expect(listViewFinder, findsOneWidget);
      });

  testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(PopularMoviesError('Error message'));

        final textFinder = find.byKey(const Key('error_message'));

        await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));

        expect(textFinder, findsOneWidget);
      });
}

// void main() {
//   late MockPopularMoviesBloc mockBloc;
//
//   setUp(() {
//     mockBloc = MockPopularMoviesBloc();
//   });
//
//   Widget makeTestableWidget(Widget body) {
//     return BlocProvider<PopularMoviesBloc>.value(
//       value: mockBloc,
//       child: MaterialApp(
//         home: body,
//       ),
//     );
//   }
//
//   testWidgets('Page should display center progress bar when loading',
//       (WidgetTester tester) async {
//     when(mockBloc.state).thenReturn(PopularMoviesLoading());
//
//     final progressBarFinder = find.byType(CircularProgressIndicator);
//     final centerFinder = find.byType(Center);
//
//     await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));
//
//     expect(centerFinder, findsOneWidget);
//     expect(progressBarFinder, findsOneWidget);
//   });
//
//   testWidgets('Page should display ListView when data is loaded',
//       (WidgetTester tester) async {
//     when(mockBloc.state).thenReturn(PopularMoviesHasData());
//     when(mockBloc).thenReturn(<Movie>[]);
//
//     final listViewFinder = find.byType(ListView);
//
//     await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));
//
//     expect(listViewFinder, findsOneWidget);
//   });
//
//   testWidgets('Page should display text with message when Error',
//       (WidgetTester tester) async {
//     when(mockBloc.state).thenReturn(RequestState.Error);
//     when(mockBloc.message).thenReturn('Error message');
//
//     final textFinder = find.byKey(const Key('error_message'));
//
//     await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));
//
//     expect(textFinder, findsOneWidget);
//   });
// }
