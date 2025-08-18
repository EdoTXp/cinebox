import 'package:cinebox/ui/profile/commands/get_user_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_view_model.g.dart';

class ProfileViewModel {
  final GetUserCommand _getUserCommand;

  ProfileViewModel({required GetUserCommand getUserCommand})
    : _getUserCommand = getUserCommand;

  Future<void> fetchUser() => _getUserCommand.execute();
}

@riverpod
ProfileViewModel profileViewModel(Ref ref) {
  return ProfileViewModel(
    getUserCommand: ref.read(getUserCommandProvider.notifier),
  );
}
