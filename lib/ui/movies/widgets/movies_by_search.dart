import 'package:cinebox/ui/movies/commands/search_movies_by_name_command.dart';
import 'package:cinebox/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesBySearch extends ConsumerStatefulWidget {
  const MoviesBySearch({super.key});

  @override
  ConsumerState<MoviesBySearch> createState() => _MoviesBySearchState();
}

class _MoviesBySearchState extends ConsumerState<MoviesBySearch> {
  @override
  Widget build(BuildContext context) {
    final moviesResult = ref.watch(searchMoviesByNameCommandProvider);

    return moviesResult.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text('Erro ao buscar filmes'),
      ),
      data: (data) => Container(
        margin: EdgeInsets.only(bottom: 130),
        child: MoviesBox(
          title: 'Filmes encontrados',
          movies: data,
          verticalScroll: true,
        ),
      ),
    );
  }
}
