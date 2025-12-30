// -------------------------
// lib/services/storage_service.dart
// -------------------------

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> saveCredentials(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> readCredentials(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> deleteCredentials(String key) async {
    await _secureStorage.delete(key: key);
  }
}
