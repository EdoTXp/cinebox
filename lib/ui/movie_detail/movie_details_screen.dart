import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/movie_detail/widgets/cast_box.dart';
import 'package:cinebox/ui/movie_detail/widgets/movie_trailer.dart';
import 'package:cinebox/ui/movie_detail/widgets/rating_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailsScreen extends ConsumerStatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  ConsumerState<MovieDetailsScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Filme'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            SizedBox(
              height: 278,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://img.elo7.com.br/product/zoom/2A1A4BF/big-poster-filme-joker-coringa-joaquin-phoenix-lo02-90x60-cm-poster.jpg',
                      placeholder: (context, url) => Container(
                        width: 160,
                        color: AppColors.lightGrey,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    'Coringa',
                    style: AppTextStyles.titleLarge,
                  ),
                  RatingStars(
                    starCount: 5,
                    starColor: AppColors.yellow,
                    starSize: 14,
                    valueLabelVisibility: false,
                    value: 3.5,
                  ),
                  Text(
                    'Gêneros',
                    style: AppTextStyles.lightGreyRegular,
                  ),
                  Text(
                    'Ano (Local) | Hora',
                    style: AppTextStyles.regularSmall,
                  ),
                  Text(
                    'Sinopse',
                    style: AppTextStyles.regularSmall,
                  ),
                  CastBox(),
                  MovieTrailer(),
                  const SizedBox(
                    height: 30,
                  ),
                  RatingPanel(
                    voteAverage: 20,
                    voteCount: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
