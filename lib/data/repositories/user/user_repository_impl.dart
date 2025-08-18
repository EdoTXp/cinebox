import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/models/me_response.dart';
import 'package:cinebox/data/services/user/user_service.dart';
import 'package:cinebox/domain/models/user.dart';
import 'package:dio/dio.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserService _userService;

  UserRepositoryImpl({required UserService userService})
    : _userService = userService;

  @override
  Future<Result<User>> getUser() async {
    try {
      final MeResponse(:email, :name, :picture) = await _userService.getMe();

      final user = User(
        email: email,
        name: name,
        picture: picture,
      );

      return Success(user);
    } on DioException catch (e, s) {
      log('Error on get user data', error: e, stackTrace: s);
      return Failure(DataException(message: 'Error on get user data'));
    }
  }
}
