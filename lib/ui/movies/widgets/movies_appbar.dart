import 'dart:async';

import 'package:cinebox/ui/core/themes/resources.dart';
import 'package:cinebox/ui/movies/movies_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesAppbar extends ConsumerStatefulWidget {
  const MoviesAppbar({super.key});

  @override
  ConsumerState<MoviesAppbar> createState() => _MoviesAppbarState();
}

class _MoviesAppbarState extends ConsumerState<MoviesAppbar> {
  Timer? _debounce;
  final _searchController = TextEditingController();

  @override
  void initState() {
    /* _searchController.addListener(() {
      _onSearchChanged(_searchController.text);
    });*/
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(Duration(milliseconds: 500), () {
      ref.read(moviesViewModelProvider.notifier).fetchMoviesBySearch(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      foregroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      expandedHeight: MediaQuery.sizeOf(context).height * 0.25,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          R.ASSETS_IMAGES_SMALL_BANNER_PNG,
          fit: BoxFit.cover,
        ),
        titlePadding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 20,
        ),
        title: SizedBox(
          height: 36,
          child: TextFormField(
            controller: _searchController,
            onChanged: _onSearchChanged,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              hintText: 'Procurar Filme',
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.search,
                  color: Colors.grey[600],
                  size: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
