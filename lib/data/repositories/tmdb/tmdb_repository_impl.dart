import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/mappers/movie_mappers.dart';
import 'package:cinebox/data/services/tmdb/tmdb_service.dart';
import 'package:cinebox/domain/models/genre.dart';

import 'package:cinebox/domain/models/movie.dart';
import 'package:dio/dio.dart';

import './tmdb_repository.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final TmdbService _tmdbService;

  TmdbRepositoryImpl({required TmdbService tmdbService})
    : _tmdbService = tmdbService;

  @override
  Future<Result<List<Movie>>> getPopularMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getPopularMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovie(moviesData));
    } on DioException catch (e, s) {
      log('Error on get Popular Movies', error: e, stackTrace: s);
      return Failure(DataException(message: 'Error on get Popular Movies'));
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlayingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getNowPlayingMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovie(moviesData));
    } on DioException catch (e, s) {
      log('Error on get Now Playing Movies', error: e, stackTrace: s);
      return Failure(DataException(message: 'Error on get Now Playing Movies'));
    }
  }

  @override
  Future<Result<List<Movie>>> getTopRatedMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getTopRatedMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovie(moviesData));
    } on DioException catch (e, s) {
      log('Error on get Top Rated Movies', error: e, stackTrace: s);
      return Failure(DataException(message: 'Error on get Top Rated Movies'));
    }
  }

  @override
  Future<Result<List<Movie>>> getUpComingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getUpComingMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovie(moviesData));
    } on DioException catch (e, s) {
      log('Error on get Up Coming Movies', error: e, stackTrace: s);
      return Failure(DataException(message: 'Error on get Up Coming Movies'));
    }
  }

  @override
  Future<Result<List<Genre>>> getGenres() async {
    try {
      final data = await _tmdbService.getMoviesGenres();
      final genres = data.genres
          .map(
            (g) => Genre(
              id: g.id,
              name: g.name,
            ),
          )
          .toList();

      return Success(genres);
    } on DioException catch (e, s) {
      log('Error to get Genres', error: e, stackTrace: s);
      return Failure(DataException(message: 'Error to get Genres'));
    }
  }

  @override
  Future<Result<List<Movie>>> getMoviesByGenres({required int genreId}) async {
    try {
      final data = await _tmdbService.discoverMovies(
        withGenres: genreId.toString(),
      );

      return Success(MovieMappers.mapToMovie(data));
    } on DioException catch (e, s) {
      log('Error to get Movies by Genre', error: e, stackTrace: s);
      return Failure(
        DataException(message: 'Error to get Movies by Genre'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> searchMovies({required String query}) async {
    try {
      final data = await _tmdbService.searchMovies(query: query);

      return Success(MovieMappers.mapToMovie(data));
    } on DioException catch (e, s) {
      log('Error to get Movies by Name', error: e, stackTrace: s);
      return Failure(
        DataException(message: 'Error to get Movies by Name'),
      );
    }
  }
}
