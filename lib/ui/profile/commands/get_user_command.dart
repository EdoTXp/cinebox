import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:cinebox/domain/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_command.g.dart';

@riverpod
class GetUserCommand extends _$GetUserCommand {
  @override
  AsyncValue<User?> build() => AsyncData(null);

  Future<void> execute() async {
    state = AsyncLoading();
    final repo = ref.read(userRepositoryProvider);
    final result = await repo.getUser();

    state = switch (result) {
      Success<User>(value: final user) => AsyncData(user),
      Failure<User>(:final error) => AsyncError(error, StackTrace.current),
    };
  }
}
