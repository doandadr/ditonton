import 'package:ditonton/data/datasources/tv/tv_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  // TvRepository,
  TvRemoteDataSource,
  // TvLocalDataSource,
  // DatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
