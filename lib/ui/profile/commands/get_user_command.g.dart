// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(GetUserCommand)
const getUserCommandProvider = GetUserCommandProvider._();

final class GetUserCommandProvider
    extends $NotifierProvider<GetUserCommand, AsyncValue<User?>> {
  const GetUserCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUserCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUserCommandHash();

  @$internal
  @override
  GetUserCommand create() => GetUserCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<User?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<User?>>(value),
    );
  }
}

String _$getUserCommandHash() => r'55ed3141a0bcc775cf311fc354089f16e58507e3';

abstract class _$GetUserCommand extends $Notifier<AsyncValue<User?>> {
  AsyncValue<User?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<User?>, AsyncValue<User?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<User?>, AsyncValue<User?>>,
              AsyncValue<User?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
