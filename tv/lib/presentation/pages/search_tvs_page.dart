import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv/presentation/pages/bloc/search/search_tvs_bloc.dart';
import 'package:tv/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchTvsPage extends StatelessWidget {
  static const ROUTE_NAME = '/search-tvs';

  const SearchTvsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (query) {
                context.read<SearchTvsBloc>().add(OnQueryChanged(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search series name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            BlocBuilder<SearchTvsBloc, SearchTvsState>(
              builder: (context, state) {
                    if (state is SearchLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is SearchHasData) {
                      final result = state.result;
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemBuilder: (context, index) {
                            final tv = result[index];
                            return TvCard(tv);
                          },
                          itemCount: result.length,
                        ),
                      );
                    } else if (state is SearchError) {
                      return Expanded(
                        child: Center(
                          child: Text(state.message),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Container(),
                      );
                    }
              },
            ),
          ],
        ),
      ),
    );
  }
}
