import 'package:core/core.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:core/presentation/pages/tv/popular_tvs_page.dart';
import 'package:core/presentation/provider/tv/popular_tvs_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'popular_tvs_page_test.mocks.dart';


@GenerateMocks([PopularTvsNotifier])
void main() {
  late MockPopularTvsNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockPopularTvsNotifier();
  });

  Widget makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<PopularTvsNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        when(mockNotifier.state).thenReturn(RequestState.Loading);

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final centerFinder = find.byType(Center);

        await tester.pumpWidget(makeTestableWidget(const PopularTvsPage()));

        expect(centerFinder, findsOneWidget);
        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        when(mockNotifier.state).thenReturn(RequestState.Loaded);
        when(mockNotifier.tvs).thenReturn(<Tv>[]);

        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(makeTestableWidget(const PopularTvsPage()));

        expect(listViewFinder, findsOneWidget);
      });

  testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(mockNotifier.state).thenReturn(RequestState.Error);
        when(mockNotifier.message).thenReturn('Error message');

        final textFinder = find.byKey(const Key('error_message'));

        await tester.pumpWidget(makeTestableWidget(const PopularTvsPage()));

        expect(textFinder, findsOneWidget);
      });
}
