// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(movieDetailsViewModel)
const movieDetailsViewModelProvider = MovieDetailsViewModelProvider._();

final class MovieDetailsViewModelProvider
    extends
        $FunctionalProvider<
          MovieDetailsViewModel,
          MovieDetailsViewModel,
          MovieDetailsViewModel
        >
    with $Provider<MovieDetailsViewModel> {
  const MovieDetailsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'movieDetailsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$movieDetailsViewModelHash();

  @$internal
  @override
  $ProviderElement<MovieDetailsViewModel> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MovieDetailsViewModel create(Ref ref) {
    return movieDetailsViewModel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MovieDetailsViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MovieDetailsViewModel>(value),
    );
  }
}

String _$movieDetailsViewModelHash() =>
    r'ea26513586a71237a1041cc1f02a40fdd45241fe';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
