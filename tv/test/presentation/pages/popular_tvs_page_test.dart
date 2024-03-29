import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv/presentation/pages/bloc/popular/popular_tvs_bloc.dart';
import 'package:tv/presentation/pages/popular_tvs_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';

class MockPopularTvsBloc
    extends MockBloc<PopularTvsEvent, PopularTvsState>
    implements PopularTvsBloc {}

class FakePopularTvsEvent extends Fake implements PopularTvsEvent {}

class FakePopularTvsState extends Fake implements PopularTvsState {}

void main() {
  late MockPopularTvsBloc mockBloc;

  setUpAll(() {
    registerFallbackValue(FakePopularTvsEvent());
    registerFallbackValue(FakePopularTvsState());
  });

  setUp(() {
    mockBloc = MockPopularTvsBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<PopularTvsBloc>.value(
      value: mockBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(PopularTvsLoading());

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final centerFinder = find.byType(Center);

        await tester.pumpWidget(makeTestableWidget(const PopularTvsPage()));

        expect(centerFinder, findsOneWidget);
        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(PopularTvsHasData(testTvList));

        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(makeTestableWidget(const PopularTvsPage()));

        expect(listViewFinder, findsOneWidget);
      });

  testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(() => mockBloc.state).thenReturn(PopularTvsError('Error message'));

        final textFinder = find.byKey(const Key('error_message'));

        await tester.pumpWidget(makeTestableWidget(const PopularTvsPage()));

        expect(textFinder, findsOneWidget);
      });
}