import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/domain/models/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> getUser();
}
