import 'package:core/data/models/tv/tv_table.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/tv/created_by.dart';
import 'package:core/domain/entities/tv/network.dart';
import 'package:core/domain/entities/tv/season.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:core/domain/entities/tv/tv_detail.dart';

final testTv = Tv(
    adult: false,
    backdropPath: "/nQSaUQzYnSE9v4CXZiOkSNndaYu.jpg",
    genreIds: [1, 2, 3, 4],
    id: 1399,
    originCountry: ["US"],
    originalLanguage: "en",
    originalName: 'Game of Thrones',
    overview:
        "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
    popularity: 600.483,
    posterPath: "/1XS1oqL89opfnbLl8WnZY1O1uJx.jpg",
    firstAirDate: "2011-04-17",
    name: 'Game of Thrones',
    voteAverage: 8.442,
    voteCount: 22481);

final testTvList = [testTv];

final testTvDetail = TvDetail(
    adult: false,
    backdropPath: "/nQSaUQzYnSE9v4CXZiOkSNndaYu.jpg",
    createdBy: [
      CreatedBy(
          id: 9813,
          creditId: '5256c8c219c2956ff604858a',
          name: 'David Benioff',
          gender: 2)
    ],
    firstAirDate: "2011-04-17",
    genres: [Genre(id: 10765, name: "Sci-Fi & Fantasy")],
    homepage: "http://www.hbo.com/game-of-thrones",
    id: 1399,
    inProduction: false,
    lastAirDate: "2019-05-19",
    name: "Game of Thrones",
    networks: [
      Network(
          id: 49,
          logoPath: "/tuomPhY2UtuPTqqFnKMVHvSb724.png",
          name: "HBO",
          originCountry: "US")
    ],
    numberOfEpisodes: 73,
    numberOfSeasons: 8,
    originalLanguage: "en",
    overview:
        "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
    popularity: 600.483,
    posterPath: "/1XS1oqL89opfnbLl8WnZY1O1uJx.jpg",
    seasons: [
      Season(
          episodeCount: 270,
          id: 3627,
          name: "Specials",
          overview: "",
          seasonNumber: 0,
          voteAverage: 0)
    ],
    status: "Ended",
    tagline: "Winter Is Coming",
    type: "Scripted",
    voteAverage: 8.442,
    voteCount: 22481);

final testWatchListTv = Tv.watchlist(
  id: 1399,
  name: 'Game of Thrones',
  overview:
      "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
  posterPath: "/1XS1oqL89opfnbLl8WnZY1O1uJx.jpg",
);

final testTvTable = TvTable(
  id: 1399,
  name: 'Game of Thrones',
  overview:
  "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
  posterPath: "/1XS1oqL89opfnbLl8WnZY1O1uJx.jpg",
);

final testTvMap = {
  'id': 1399,
  'name': 'Game of Thrones',
  'overview':
  "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
  'posterPath': "/1XS1oqL89opfnbLl8WnZY1O1uJx.jpg",
};
