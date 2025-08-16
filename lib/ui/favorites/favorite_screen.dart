import 'package:cinebox/domain/models/favorite_movie.dart';
import 'package:cinebox/ui/core/widgets/loader_messages.dart';
import 'package:cinebox/ui/core/widgets/movie_card.dart';
import 'package:cinebox/ui/favorites/commands/get_favorites_command.dart';
import 'package:cinebox/ui/favorites/favorites_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen>
    with LoaderAndMessages {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favoritesViewModelProvider).fetchFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(getFavoritesCommandProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Favoritos'),
      ),
      body: favoriteMovies.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Erro ao buscar filmes favoritos'),
        ),
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('Nenhum filme favorito cadastrado'),
            );
          }

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 148,
                    mainAxisExtent: 268,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: data.length,
                    (context, index) {
                      final FavoriteMovie(
                        :id,
                        :title,
                        :year,
                        posterPath: imageUrl,
                      ) = data[index];

                      return Container(
                        margin: EdgeInsets.all(8),
                        child: MovieCard(
                          key: UniqueKey(),
                          id: id,
                          title: title,
                          year: year,
                          imageUrl: imageUrl,
                          isFavorite: true,
                          onFavoriteTap: () async {
                            showLoader();
                            await ref
                                .read(favoritesViewModelProvider)
                                .deleteFavoriteMovie(id);
                            hideLoader();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
