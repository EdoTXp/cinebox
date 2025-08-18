import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_command.g.dart';

@riverpod
class LogoutCommand extends _$LogoutCommand {
  @override
  AsyncValue<bool?> build() => AsyncData(null);

  Future<void> execute() async {
    state = AsyncLoading();

    final repo = ref.read(authRepositoryProvider);
    final result = await repo.signOut();

    state = switch (result) {
      Success() => AsyncData(true),
      Failure() => AsyncData(false),
    };
  }
}
