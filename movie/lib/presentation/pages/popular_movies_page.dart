import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/pages/bloc/popular/popular_movies_bloc.dart';
import 'package:movie/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';

class PopularMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-movies';

  const PopularMoviesPage({super.key});

  @override
  _PopularMoviesPageState createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<PopularMoviesBloc>().add(FetchPopularMovies());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
          builder: (context, state) {
                if (state is PopularMoviesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PopularMoviesHasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final movie = state.result[index];
                      return MovieCard(movie);
                    },
                    itemCount: state.result.length,
                  );
                } else if (state is PopularMoviesError) {
                  return Center(
                    key: const Key('error_message'),
                    child: Text(state.message),
                  );
                } else {
                  return Container();
                }
          },
        ),
      ),
    );
  }
}
