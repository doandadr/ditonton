part of 'search_tvs_bloc.dart';

abstract class SearchTvsEvent extends Equatable {
  const SearchTvsEvent();
}

class OnQueryChanged extends SearchTvsEvent {
  final String query;

  OnQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}
