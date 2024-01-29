import 'dart:convert';

import 'package:core/data/models/tv/tv_model.dart';
import 'package:core/data/models/tv/tv_response.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../json_reader.dart';

void main() {
  const tTvModel = TvModel(
      adult: false,
      backdropPath: "/eWF3oRyL4QWaidN9F4uvM7cBJUV.jpg",
      genreIds: [10766],
      id: 206559,
      originCountry: ["ZA"],
      originalLanguage: "af",
      originalName: "Binnelanders",
      overview:
          "A South African Afrikaans soap opera. It is set in and around the fictional private hospital, Binneland Kliniek, in Pretoria, and the storyline follows the trials, trauma and tribulations of the staff and patients of the hospital.",
      popularity: 2965.138,
      posterPath: "/v9nGSRx5lFz6KEgfmgHJMSgaARC.jpg",
      firstAirDate: "2005-10-13",
      name: "Binnelanders",
      voteAverage: 6.37,
      voteCount: 27);

  const tTvResponseModel = TvResponse(tvList: <TvModel>[tTvModel]);

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/tv/on_the_air.json'));
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
        "results": [
          {
            "adult": false,
            "backdrop_path": "/eWF3oRyL4QWaidN9F4uvM7cBJUV.jpg",
            "genre_ids": [10766],
            "id": 206559,
            "origin_country": ["ZA"],
            "original_language": "af",
            "original_name": "Binnelanders",
            "overview":
                "A South African Afrikaans soap opera. It is set in and around the fictional private hospital, Binneland Kliniek, in Pretoria, and the storyline follows the trials, trauma and tribulations of the staff and patients of the hospital.",
            "popularity": 2965.138,
            "poster_path": "/v9nGSRx5lFz6KEgfmgHJMSgaARC.jpg",
            "first_air_date": "2005-10-13",
            "name": "Binnelanders",
            "vote_average": 6.37,
            "vote_count": 27
          }
        ]
      };
      expect(result, expectedJsonMap);
    });
  });
}
