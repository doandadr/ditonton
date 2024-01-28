import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tv/presentation/pages/bloc/on_the_air/on_the_air_tvs_bloc.dart';
import 'package:tv/presentation/pages/bloc/top_rated/top_rated_tvs_bloc.dart';

import 'bloc/popular/popular_tvs_bloc.dart';

class HomeTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/home-tv';

  const HomeTvPage({super.key});

  @override
  _HomeTvPageState createState() => _HomeTvPageState();
}

class _HomeTvPageState extends State<HomeTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<OnTheAirTvsBloc>().add(FetchOnTheAirTvs());
      context.read<PopularTvsBloc>().add(FetchPopularTvs());
      context.read<TopRatedTvsBloc>().add(FetchTopRatedTvs());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Movies'),
              onTap: () {
                Navigator.pushReplacementNamed(context, homeMoviePageRoute);
              },
            ),
            ListTile(
              key: const Key('tv_series'),
              leading: const Icon(Icons.tv),
              title: const Text('Tv Series'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Movie Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, watchlistMoviesPageRoute);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Tv Series Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, watchlistTvsPageRoute);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, aboutPageRoute);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Tv Series'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, searchTvsPageRoute);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSubHeading(
                title: 'On The Air',
                onTap: () => Navigator.pushNamed(context, onTheAirTvsPageRoute),
              ),
              BlocBuilder<OnTheAirTvsBloc, OnTheAirTvsState>(
                builder: (context, state) {
                  if (state is OnTheAirTvsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is OnTheAirTvsHasData) {
                    return TvList(state.result);
                  } else if (state is OnTheAirTvsError) {
                    return const Text('Failed');
                  } else {
                    return Container();
                  }
                },
              ),
              _buildSubHeading(
                title: 'Popular',
                onTap: () => Navigator.pushNamed(context, popularTvsPageRoute),
              ),
              BlocBuilder<PopularTvsBloc, PopularTvsState>(
                builder: (context, state) {
                  if (state is PopularTvsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is PopularTvsHasData) {
                    return TvList(state.result);
                  } else if (state is PopularTvsError) {
                    return const Text('Failed');
                  } else {
                    return Container();
                  }
                },
              ),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () => Navigator.pushNamed(context, topRatedTvsPageRoute),
              ),
              BlocBuilder<TopRatedTvsBloc, TopRatedTvsState>(
                builder: (context, state) {
                  if (state is TopRatedTvsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TopRatedTvsHasData) {
                    return TvList(state.result);
                  } else if (state is TopRatedTvsError) {
                    return const Text('Failed');
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvList extends StatelessWidget {
  final List<Tv> tvs;

  const TvList(this.tvs, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tv = tvs[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  tvDetailPageRoute,
                  arguments: tv.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tv.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvs.length,
      ),
    );
  }
}
