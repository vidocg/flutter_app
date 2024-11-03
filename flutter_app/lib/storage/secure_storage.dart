import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final SecureStorage _singleton = SecureStorage._internal();

  factory SecureStorage() {
    return _singleton;
  }

  SecureStorage._internal();

  final _storage = const FlutterSecureStorage();

  void putJwt(String jwt) async {
    debugPrint("Jwt put to storage");
    await _storage.write(
      key: 'jwt',
      value: jwt,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
    debugPrint("Jwt was updated");
  }

  Future<String?> getJwt() {
    return _storage.read(key: 'jwt');
  }

  IOSOptions _getIOSOptions() => const IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      );

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  void clean() {}
}
