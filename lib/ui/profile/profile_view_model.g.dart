// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(profileViewModel)
const profileViewModelProvider = ProfileViewModelProvider._();

final class ProfileViewModelProvider
    extends
        $FunctionalProvider<
          ProfileViewModel,
          ProfileViewModel,
          ProfileViewModel
        >
    with $Provider<ProfileViewModel> {
  const ProfileViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileViewModelHash();

  @$internal
  @override
  $ProviderElement<ProfileViewModel> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProfileViewModel create(Ref ref) {
    return profileViewModel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileViewModel>(value),
    );
  }
}

String _$profileViewModelHash() => r'a4465b3a08d03ddf66b56d15a5332e22ce81dcdb';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
