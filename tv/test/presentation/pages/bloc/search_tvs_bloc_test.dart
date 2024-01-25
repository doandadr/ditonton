import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:tv/domain/usecases/search_tvs.dart';

import 'search_tvs_bloc_test.mocks.dart';

@GenerateMocks([SearchTvs])
void main() {
  late SearchTvsBloc searchBloc;
  late MockSearchTvs mockSearchTvs;

  setUp(() {
    mockSearchTvs = MockSearchTvs();
    searchBloc = SearchTvsBloc(mockSearchTvs);
  })
}
