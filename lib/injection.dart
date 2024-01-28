import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/data/datasources/movie/movie_local_data_source.dart';
import 'package:core/data/datasources/movie/movie_remote_data_source.dart';
import 'package:core/data/datasources/tv/tv_local_data_source.dart';
import 'package:core/data/datasources/tv/tv_remote_data_source.dart';
import 'package:core/data/repositories/movie/movie_repository_impl.dart';
import 'package:core/data/repositories/tv/tv_repository_impl.dart';
import 'package:core/domain/repositories/movie/movie_repository.dart';
import 'package:core/domain/repositories/tv/tv_repository.dart';
import 'package:core/utils/http_ssl_pinning.dart';
import 'package:movie/domain/usecases/get_movie_detail.dart';
import 'package:movie/domain/usecases/get_movie_recommendations.dart';
import 'package:movie/domain/usecases/get_now_playing_movies.dart';
import 'package:movie/domain/usecases/get_popular_movies.dart';
import 'package:movie/domain/usecases/get_top_rated_movies.dart';
import 'package:movie/domain/usecases/get_watchlist_movies.dart';
import 'package:movie/domain/usecases/get_watchlist_status.dart' as MovieGWS;
import 'package:movie/domain/usecases/remove_watchlist.dart' as MovieRW;
import 'package:movie/domain/usecases/save_watchlist.dart' as MovieSW;
import 'package:movie/presentation/pages/bloc/detail/movie_detail_bloc.dart';
import 'package:movie/presentation/pages/bloc/now_playing/now_playing_movies_bloc.dart';
import 'package:movie/presentation/pages/bloc/popular/popular_movies_bloc.dart';
import 'package:movie/presentation/pages/bloc/recommendations/movie_recommendations_bloc.dart';
import 'package:movie/presentation/pages/bloc/search/search_movies_bloc.dart';
import 'package:movie/presentation/pages/bloc/top_rated/top_rated_movies_bloc.dart';
import 'package:movie/presentation/pages/bloc/watchlist/movie_watchlist_bloc.dart';
import 'package:tv/domain/usecases/get_on_the_air_tvs.dart';
import 'package:tv/domain/usecases/get_popular_tvs.dart';
import 'package:tv/domain/usecases/get_top_rated_tvs.dart';
import 'package:tv/domain/usecases/get_tv_detail.dart';
import 'package:tv/domain/usecases/get_tv_recommendations.dart';
import 'package:tv/domain/usecases/get_watchlist_status.dart' as TvGWS;
import 'package:tv/domain/usecases/get_watchlist_tvs.dart';
import 'package:tv/domain/usecases/remove_watchlist.dart' as TvRW;
import 'package:tv/domain/usecases/save_watchlist.dart' as TvSW;
import 'package:movie/domain/usecases/search_movies.dart';
import 'package:tv/domain/usecases/search_tvs.dart';
import 'package:tv/presentation/pages/bloc/detail/tv_detail_bloc.dart';
import 'package:tv/presentation/pages/bloc/on_the_air/on_the_air_tvs_bloc.dart';
import 'package:tv/presentation/pages/bloc/popular/popular_tvs_bloc.dart';
import 'package:tv/presentation/pages/bloc/recommendations/tv_recommendations_bloc.dart';
import 'package:tv/presentation/pages/bloc/search/search_tvs_bloc.dart';
import 'package:tv/presentation/pages/bloc/top_rated/top_rated_tvs_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:tv/presentation/pages/bloc/watchlist/tv_watchlist_bloc.dart';

final locator = GetIt.instance;

void init() {
  // PROVIDER
  // movie
  locator.registerFactory(
    () => MovieDetailBloc(
      getMovieDetail: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieRecommendationsBloc(
      getMovieRecommendations: locator(),
    ),
  );
  locator.registerFactory(
    () => NowPlayingMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => SearchMoviesBloc(
      locator(),
    ),
  );

  // TV
  locator.registerFactory(
    () => TvDetailBloc(
      getTvDetail: locator(),
    ),
  );
  locator.registerFactory(
    () => TvRecommendationsBloc(
      getTvRecommendations: locator(),
    ),
  );
  locator.registerFactory(
    () => TvWatchlistBloc(
      saveWatchlist: locator(),
      removeWatchlist: locator(),
      getWatchListStatus: locator(),
      getWatchlistTvs: locator(),
    ),
  );
  locator.registerFactory(
    () => OnTheAirTvsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularTvsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedTvsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => SearchTvsBloc(
      locator(),
    ),
  );

  // USE CASE
  // movie
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => MovieGWS.GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => MovieSW.SaveWatchlist(locator()));
  locator.registerLazySingleton(() => MovieRW.RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  // tv
  locator.registerLazySingleton(() => GetOnTheAirTvs(locator()));
  locator.registerLazySingleton(() => GetPopularTvs(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvs(locator()));
  locator.registerLazySingleton(() => GetTvDetail(locator()));
  locator.registerLazySingleton(() => GetTvRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTvs(locator()));
  locator.registerLazySingleton(() => TvGWS.GetWatchlistStatus(locator()));
  locator.registerLazySingleton(() => TvSW.SaveWatchlist(locator()));
  locator.registerLazySingleton(() => TvRW.RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvs(locator()));

  // REPOSITORY
  // movie
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  // tv
  locator.registerLazySingleton<TvRepository>(
    () => TvRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // DATA SOURCES
  // movie
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  // tv
  locator.registerLazySingleton<TvRemoteDataSource>(
      () => TvRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvLocalDataSource>(
      () => TvLocalDataSourceImpl(databaseHelper: locator()));

  // HELPER
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // EXTERNAL
  locator.registerLazySingleton(() => HttpSSLPinning.client);
}
