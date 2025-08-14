import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/services/google_sign_in/google_sign_in_service.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;
  final GoogleSignInService _googleSignInService;

  AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required GoogleSignInService googleSignInService,
  }) : _localStorageService = localStorageService,
       _googleSignInService = googleSignInService;

  @override
  Future<Result<bool>> isLogged() async {
    final result = await _localStorageService.getIdToken();

    return switch (result) {
      Success<String>() => Success(true),
      Failure<String>() => Success(false),
    };
  }

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSignInService.signIn();

    switch (result) {
      case Success<String>(:final value):
        await _localStorageService.saveIdToken(value);
        //! Create login in backend
        return successOfUnit();
      case Failure<String>(:final error):
        log(
          'Error on login',
          name: 'AuthRepository',
          error: error,
        );
        return Failure(DataException(message: 'Error on login with Google'));
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    final result = await _googleSignInService.signOut();

    switch (result) {
      case Success<Unit>():
        final removeResult = await _localStorageService.removeIdToken();

        switch (removeResult) {
          case Success<Unit>():
            return successOfUnit();
          case Failure<Unit>(:final error):
            log('Error on logout ID Token');
            return Failure(error);
        }

      case Failure<Unit>(:final error):
        return Failure(error);
    }
  }
}
