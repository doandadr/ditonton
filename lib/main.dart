import 'dart:ui';

import 'package:about/about.dart';
import 'package:core/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/pages/bloc/detail/movie_detail_bloc.dart';
import 'package:movie/presentation/pages/bloc/now_playing/now_playing_movies_bloc.dart';
import 'package:movie/presentation/pages/bloc/popular/popular_movies_bloc.dart';
import 'package:movie/presentation/pages/bloc/recommendations/movie_recommendations_bloc.dart';
import 'package:movie/presentation/pages/bloc/search/search_movies_bloc.dart';
import 'package:movie/presentation/pages/bloc/top_rated/top_rated_movies_bloc.dart';
import 'package:movie/presentation/pages/bloc/watchlist/movie_watchlist_bloc.dart';
import 'package:movie/presentation/pages/movie_detail_page.dart';
import 'package:movie/presentation/pages/home_movie_page.dart';
import 'package:movie/presentation/pages/now_playing_movies_page.dart';
import 'package:movie/presentation/pages/popular_movies_page.dart';
import 'package:movie/presentation/pages/search_movies_page.dart';
import 'package:movie/presentation/pages/top_rated_movies_page.dart';
import 'package:movie/presentation/pages/watchlist_movies_page.dart';
import 'package:tv/presentation/pages/bloc/detail/tv_detail_bloc.dart';
import 'package:tv/presentation/pages/bloc/on_the_air/on_the_air_tvs_bloc.dart';
import 'package:tv/presentation/pages/bloc/popular/popular_tvs_bloc.dart';
import 'package:tv/presentation/pages/bloc/recommendations/tv_recommendations_bloc.dart';
import 'package:tv/presentation/pages/bloc/search/search_tvs_bloc.dart';
import 'package:tv/presentation/pages/bloc/top_rated/top_rated_tvs_bloc.dart';
import 'package:tv/presentation/pages/bloc/watchlist/tv_watchlist_bloc.dart';
import 'package:tv/presentation/pages/home_tv_page.dart';
import 'package:tv/presentation/pages/on_the_air_tvs_page.dart';
import 'package:tv/presentation/pages/popular_tvs_page.dart';
import 'package:tv/presentation/pages/search_tvs_page.dart';
import 'package:tv/presentation/pages/top_rated_tvs_page.dart';
import 'package:tv/presentation/pages/tv_detail_page.dart';
import 'package:tv/presentation/pages/watchlist_tvs_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:ditonton/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await HttpSSLPinning.init();

  di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Movies
        BlocProvider(
          create: (_) => di.locator<MovieDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieRecommendationsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieWatchlistBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<NowPlayingMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchMoviesBloc>(),
        ),

        // TV SERIES
        BlocProvider(
          create: (_) => di.locator<TvDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvRecommendationsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvWatchlistBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<OnTheAirTvsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedTvsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularTvsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchTvsBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case aboutPageRoute:
              return MaterialPageRoute(builder: (_) => AboutPage());

            // Movies
            case homeMoviePageRoute:
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case nowPlayingMoviesPageRoute:
              return CupertinoPageRoute(builder: (_) => NowPlayingMoviesPage());
            case popularMoviesPageRoute:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case topRatedMoviesPageRoute:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case movieDetailPageRoute:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case searchMoviesPageRoute:
              return CupertinoPageRoute(builder: (_) => SearchMoviesPage());
            case watchlistMoviesPageRoute:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            // Tv
            case homeTvPageRoute:
              return MaterialPageRoute(builder: (_) => HomeTvPage());
            case onTheAirTvsPageRoute:
              return CupertinoPageRoute(builder: (_) => OnTheAirTvsPage());
            case popularTvsPageRoute:
              return CupertinoPageRoute(builder: (_) => PopularTvsPage());
            case topRatedTvsPageRoute:
              return CupertinoPageRoute(builder: (_) => TopRatedTvsPage());
            case tvDetailPageRoute:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvDetailPage(id: id),
                settings: settings,
              );
            case searchTvsPageRoute:
              return CupertinoPageRoute(builder: (_) => SearchTvsPage());
            case watchlistTvsPageRoute:
              return MaterialPageRoute(builder: (_) => WatchlistTvsPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
