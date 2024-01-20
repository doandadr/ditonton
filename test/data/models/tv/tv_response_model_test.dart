import 'dart:convert';

import 'package:ditonton/data/models/tv/tv_model.dart';
import 'package:ditonton/data/models/tv/tv_response.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../json_reader.dart';

void main() {
  final tTvModel = TvModel(
    adult: false,
    backdropPath: "/path.jpg",
    genreIds: [1, 2, 3, 4],
    id: 1,
    originCountry: ["A", "B", "C"],
    originalLanguage: "Original Language",
    originalName: "Original Name",
    overview: "Overview",
    popularity: 1.0,
    posterPath: "/path.jpg",
    firstAirDate: "2020-05-05",
    name: "Name",
    voteAverage: 1.0,
    voteCount: 1,
  );

  final tTvResponseModel = TvResponse(tvList: <TvModel>[tTvModel]);

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/tv/now_playing.json'));
      // act
      final result = TvResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        {
          "results": [
            {
              "poster_path": "/path.jpg",
              "popularity": 2.3,
              "id": 1,
              "backdrop_path": "/path.jpg",
              "vote_average": 8.0,
              "overview": "Overview",
              "first_air_date": "2022-10-10",
              "origin_country": [
                "en",
                "id"
              ],
              "genre_ids": [
                1,
                2,
                3
              ],
              "original_language": "Original Language",
              "vote_count": 230,
              "name": "Name",
              "original_name": "Original Name"
            }
          ],
          "total_results": 192,
          "total_pages": 10
        }
      };
      expect(result, expectedJsonMap);
    });
  });
}