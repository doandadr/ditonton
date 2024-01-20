import 'dart:convert';

import 'package:ditonton/data/models/tv/tv_model.dart';
import 'package:ditonton/data/models/tv/tv_response.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../json_reader.dart';

void main() {
  final tTvModel = TvModel(
      posterPath: "/path.jpg",
      popularity: 2.3,
      id: 1,
      backdropPath: "/path.jpg",
      voteAverage: 8.0,
      overview: "Overview",
      firstAirDate: "2022-10-10",
      originCountry: ["en", "id"],
      genreIds: [1, 2, 3],
      originalLanguage: "Original Language",
      voteCount: 230,
      name: "Name",
      originalName: "Original Name",
      adult: false);

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
      final expectedJsonMap =
        {
          "results": [
            {
              "adult": false,
              "backdrop_path": "/path.jpg",
              "first_air_date": "2022-10-10",
              "genre_ids": [
                1,
                2,
                3
              ],
              "id": 1,
              "name": "Name",
              "origin_country": [
                "en",
                "id"
              ],
              "original_language": "Original Language",
              "original_name": "Original Name",
              "overview": "Overview",
              "popularity": 2.3,
              "poster_path": "/path.jpg",
              "vote_average": 8.0,
              "vote_count": 230
            }
          ]
        };
      expect(result, expectedJsonMap);
    });
  });
}
