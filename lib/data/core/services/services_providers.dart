import 'package:cinebox/data/core/services/local_storage/local_storage_service.dart';
import 'package:cinebox/data/core/services/local_storage/local_storage_service_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services_providers.g.dart';

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) {
  return LocalStorageServiceImpl(
    storage: FlutterSecureStorage(),
  );
}
