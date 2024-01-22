import 'dart:convert';

import 'package:core/data/models/tv/tv_model.dart';
import 'package:core/data/models/tv/tv_response.dart';
import 'package:core/domain/entities/tv/tv.dart';
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

  final tTv = Tv(
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

  test('should be a subclass of Tv Entity', () async {
    final result = tTvModel.toEntity();
    expect(result, tTv);
  });
}
