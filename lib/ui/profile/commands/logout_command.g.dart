// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(LogoutCommand)
const logoutCommandProvider = LogoutCommandProvider._();

final class LogoutCommandProvider
    extends $NotifierProvider<LogoutCommand, AsyncValue<bool?>> {
  const LogoutCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutCommandHash();

  @$internal
  @override
  LogoutCommand create() => LogoutCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<bool?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<bool?>>(value),
    );
  }
}

String _$logoutCommandHash() => r'a244e541564969193df3c59634b2663cc1f63832';

abstract class _$LogoutCommand extends $Notifier<AsyncValue<bool?>> {
  AsyncValue<bool?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool?>, AsyncValue<bool?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool?>, AsyncValue<bool?>>,
              AsyncValue<bool?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
