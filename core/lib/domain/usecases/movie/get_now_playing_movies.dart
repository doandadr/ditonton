import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/movie/movie.dart';
import 'package:core/domain/repositories/movie/movie_repository.dart';
import 'package:core/core.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlayingMovies();
  }
}
