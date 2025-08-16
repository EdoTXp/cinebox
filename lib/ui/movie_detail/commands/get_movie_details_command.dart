import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:cinebox/domain/models/movie_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_details_command.g.dart';

@riverpod
class GetMovieDetailsCommand extends _$GetMovieDetailsCommand {
  @override
  AsyncValue<MovieDetail?> build() => AsyncLoading();

  Future<void> execute(int movieId) async {
    final repo = ref.read(tmdbRepositoryProvider);
    final result = await repo.getMovieDetails(movieId: movieId);

    state = switch (result) {
      Success(:final value) => AsyncData(value),
      Failure() => AsyncError(
        'Error to get Movie Details',
        StackTrace.current,
      ),
    };
  }
}
