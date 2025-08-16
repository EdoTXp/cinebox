import 'package:cinebox/ui/movie_detail/commands/get_movie_details_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_details_view_model.g.dart';

class MovieDetailsViewModel {
  final GetMovieDetailsCommand _getMovieDetailsCommand;

  MovieDetailsViewModel({
    required GetMovieDetailsCommand getMovieDetailsCommand,
  }) : _getMovieDetailsCommand = getMovieDetailsCommand;

  Future<void> fetchMovieDetails(int movieId) async =>
      _getMovieDetailsCommand.execute(movieId);
}

@riverpod
MovieDetailsViewModel movieDetailsViewModel(Ref ref) {
  return MovieDetailsViewModel(
    getMovieDetailsCommand: ref.watch(getMovieDetailsCommandProvider.notifier),
  );
}
