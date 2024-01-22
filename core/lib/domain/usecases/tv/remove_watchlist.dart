import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv/tv_detail.dart';
import 'package:core/domain/repositories/tv/tv_repository.dart';

class RemoveWatchlist {
  final TvRepository repository;

  RemoveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvDetail tv) =>
      repository.removeWatchlist(tv);
}
