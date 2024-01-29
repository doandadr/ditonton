import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv/presentation/pages/bloc/top_rated/top_rated_tvs_bloc.dart';
import 'package:tv/presentation/pages/top_rated_tvs_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

class MockTopRatedTvsBloc extends MockBloc<TopRatedTvsEvent, TopRatedTvsState> implements TopRatedTvsBloc {}

class FakeTopRatedTvsEvent extends Fake implements TopRatedTvsEvent {}

class FakeTopRatedTvsState extends Fake implements TopRatedTvsState {}

void main() {
  late MockTopRatedTvsBloc mockBloc;

  setUpAll(() {
    registerFallbackValue(FakeTopRatedTvsEvent());
    registerFallbackValue(FakeTopRatedTvsState());
  });

  setUp(() {
    mockBloc = MockTopRatedTvsBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<TopRatedTvsBloc>.value(
      value: mockBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(TopRatedTvsLoading());

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final centerFinder = find.byType(Center);

        await tester.pumpWidget(makeTestableWidget(const TopRatedTvsPage()));

        expect(centerFinder, findsOneWidget);
        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(TopRatedTvsHasData(testTvList));

        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(makeTestableWidget(const TopRatedTvsPage()));

        expect(listViewFinder, findsOneWidget);
      });

  testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(const TopRatedTvsError('Error message'));

        final textFinder = find.byKey(const Key('error_message'));

        await tester.pumpWidget(makeTestableWidget(const TopRatedTvsPage()));

        expect(textFinder, findsOneWidget);
      });
}