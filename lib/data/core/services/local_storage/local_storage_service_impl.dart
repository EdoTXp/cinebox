import 'package:cinebox/core/result/result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import './local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  final FlutterSecureStorage _storage;
  static const String _key = 'id_token';

  LocalStorageServiceImpl({required FlutterSecureStorage storage})
    : _storage = storage;

  @override
  Future<Result<String>> getIdToken() async {
    final token = await _storage.read(key: _key);
    
    if (token == null) {
      return Failure(Exception('Token not found'));
    }

    return Success(token);
  }

  @override
  Future<Result<Unit>> removeIdToken() async {
    await _storage.delete(key: _key);
    return successOfUnit();
  }

  @override
  Future<Result<Unit>> saveIdToken(String token) async {
    await _storage.write(key: _key, value: token);
    return successOfUnit();
  }
}
