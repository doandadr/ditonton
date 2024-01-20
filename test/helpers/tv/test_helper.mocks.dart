// Mocks generated by Mockito 5.4.4 from annotations
// in ditonton/test/helpers/tv/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i18;
import 'dart:typed_data' as _i19;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ditonton/common/failure.dart' as _i7;
import 'package:ditonton/data/datasources/db/database_helper.dart' as _i15;
import 'package:ditonton/data/datasources/tv/tv_local_data_source.dart' as _i12;
import 'package:ditonton/data/datasources/tv/tv_remote_data_source.dart'
    as _i10;
import 'package:ditonton/data/models/movie/movie_table.dart' as _i17;
import 'package:ditonton/data/models/tv/tv_detail_model.dart' as _i3;
import 'package:ditonton/data/models/tv/tv_model.dart' as _i11;
import 'package:ditonton/data/models/tv/tv_table.dart' as _i13;
import 'package:ditonton/domain/entities/tv/tv.dart' as _i8;
import 'package:ditonton/domain/entities/tv/tv_detail.dart' as _i9;
import 'package:ditonton/domain/repositories/tv/tv_repository.dart' as _i5;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i14;
import 'package:sqflite/sqflite.dart' as _i16;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvDetailResponse_1 extends _i1.SmartFake
    implements _i3.TvDetailResponse {
  _FakeTvDetailResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2 extends _i1.SmartFake implements _i4.Response {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_3 extends _i1.SmartFake
    implements _i4.StreamedResponse {
  _FakeStreamedResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TvRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRepository extends _i1.Mock implements _i5.TvRepository {
  MockTvRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>> getOnTheAirTvs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getOnTheAirTvs,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Tv>>(
          this,
          Invocation.method(
            #getOnTheAirTvs,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>> getPopularTvs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTvs,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Tv>>(
          this,
          Invocation.method(
            #getPopularTvs,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>> getTopRatedTvs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvs,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Tv>>(
          this,
          Invocation.method(
            #getTopRatedTvs,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.TvDetail>> getTvDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvDetail,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i9.TvDetail>>.value(
            _FakeEither_0<_i7.Failure, _i9.TvDetail>(
          this,
          Invocation.method(
            #getTvDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.TvDetail>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>> getTvRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvRecommendations,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Tv>>(
          this,
          Invocation.method(
            #getTvRecommendations,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>> searchTvs(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvs,
          [query],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Tv>>(
          this,
          Invocation.method(
            #searchTvs,
            [query],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveWatchlist(
          _i9.TvDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [movie],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [movie],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeWatchlist(
          _i9.TvDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [movie],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>> getWatchlistTvs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvs,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Tv>>(
          this,
          Invocation.method(
            #getWatchlistTvs,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Tv>>>);
}

/// A class which mocks [TvRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRemoteDataSource extends _i1.Mock
    implements _i10.TvRemoteDataSource {
  MockTvRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i11.TvModel>> getOnTheAirTvs() => (super.noSuchMethod(
        Invocation.method(
          #getOnTheAirTvs,
          [],
        ),
        returnValue: _i6.Future<List<_i11.TvModel>>.value(<_i11.TvModel>[]),
      ) as _i6.Future<List<_i11.TvModel>>);
  @override
  _i6.Future<List<_i11.TvModel>> getPopularTvs() => (super.noSuchMethod(
        Invocation.method(
          #getPopularTvs,
          [],
        ),
        returnValue: _i6.Future<List<_i11.TvModel>>.value(<_i11.TvModel>[]),
      ) as _i6.Future<List<_i11.TvModel>>);
  @override
  _i6.Future<List<_i11.TvModel>> getTopRatedTvs() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvs,
          [],
        ),
        returnValue: _i6.Future<List<_i11.TvModel>>.value(<_i11.TvModel>[]),
      ) as _i6.Future<List<_i11.TvModel>>);
  @override
  _i6.Future<_i3.TvDetailResponse> getTvDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvDetail,
          [id],
        ),
        returnValue:
            _i6.Future<_i3.TvDetailResponse>.value(_FakeTvDetailResponse_1(
          this,
          Invocation.method(
            #getTvDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.TvDetailResponse>);
  @override
  _i6.Future<List<_i11.TvModel>> getTvRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvRecommendations,
          [id],
        ),
        returnValue: _i6.Future<List<_i11.TvModel>>.value(<_i11.TvModel>[]),
      ) as _i6.Future<List<_i11.TvModel>>);
  @override
  _i6.Future<List<_i11.TvModel>> searchTvs(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvs,
          [query],
        ),
        returnValue: _i6.Future<List<_i11.TvModel>>.value(<_i11.TvModel>[]),
      ) as _i6.Future<List<_i11.TvModel>>);
}

/// A class which mocks [TvLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvLocalDataSource extends _i1.Mock implements _i12.TvLocalDataSource {
  MockTvLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchlist(_i13.TvTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [tv],
        ),
        returnValue: _i6.Future<String>.value(_i14.dummyValue<String>(
          this,
          Invocation.method(
            #insertWatchlist,
            [tv],
          ),
        )),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> removeWatchlist(_i13.TvTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [tv],
        ),
        returnValue: _i6.Future<String>.value(_i14.dummyValue<String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [tv],
          ),
        )),
      ) as _i6.Future<String>);
  @override
  _i6.Future<_i13.TvTable?> getTvById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvById,
          [id],
        ),
        returnValue: _i6.Future<_i13.TvTable?>.value(),
      ) as _i6.Future<_i13.TvTable?>);
  @override
  _i6.Future<List<_i13.TvTable>> getWatchlistTvs() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvs,
          [],
        ),
        returnValue: _i6.Future<List<_i13.TvTable>>.value(<_i13.TvTable>[]),
      ) as _i6.Future<List<_i13.TvTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i15.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i16.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i6.Future<_i16.Database?>.value(),
      ) as _i6.Future<_i16.Database?>);
  @override
  _i6.Future<int> insertWatchlistMovie(_i17.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistMovie,
          [movie],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<int> insertWatchlistTv(_i13.TvTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistTv,
          [tv],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlistMovie(_i17.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistMovie,
          [movie],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlistTv(_i13.TvTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTv,
          [tv],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieById,
          [id],
        ),
        returnValue: _i6.Future<Map<String, dynamic>?>.value(),
      ) as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<Map<String, dynamic>?> getTvById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvById,
          [id],
        ),
        returnValue: _i6.Future<Map<String, dynamic>?>.value(),
      ) as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i6.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i6.Future<List<Map<String, dynamic>>>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistTvs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvs,
          [],
        ),
        returnValue: _i6.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i6.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i18.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i18.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i18.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i18.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<String>.value(_i14.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<String>);
  @override
  _i6.Future<_i19.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i19.Uint8List>.value(_i19.Uint8List(0)),
      ) as _i6.Future<_i19.Uint8List>);
  @override
  _i6.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i6.Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i6.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
