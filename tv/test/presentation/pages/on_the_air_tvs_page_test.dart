import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv/presentation/pages/bloc/on_the_air/on_the_air_tvs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv/presentation/pages/on_the_air_tvs_page.dart';

import '../../dummy_data/dummy_objects.dart';

class MockOnTheAirTvsBloc
    extends MockBloc<OnTheAirTvsEvent, OnTheAirTvsState>
    implements OnTheAirTvsBloc {}

class FakeOnTheAirTvsEvent extends Fake implements OnTheAirTvsEvent {}

class FakeOnTheAirTvsState extends Fake implements OnTheAirTvsState {}

void main() {
  late MockOnTheAirTvsBloc mockBloc;

  setUpAll(() {
    registerFallbackValue(FakeOnTheAirTvsEvent());
    registerFallbackValue(FakeOnTheAirTvsState());
  });

  setUp(() {
    mockBloc = MockOnTheAirTvsBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<OnTheAirTvsBloc>.value(
      value: mockBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(OnTheAirTvsLoading());

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final centerFinder = find.byType(Center);

        await tester.pumpWidget(makeTestableWidget(const OnTheAirTvsPage()));

        expect(centerFinder, findsOneWidget);
        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(OnTheAirTvsHasData(testTvList));

        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(makeTestableWidget(const OnTheAirTvsPage()));

        expect(listViewFinder, findsOneWidget);
      });

  testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(OnTheAirTvsError('Error message'));

        final textFinder = find.byKey(const Key('error_message'));

        await tester.pumpWidget(makeTestableWidget(const OnTheAirTvsPage()));

        expect(textFinder, findsOneWidget);
      });
}