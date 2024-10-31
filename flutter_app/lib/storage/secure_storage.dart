import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final SecureStorage _singleton = SecureStorage._internal();

  factory SecureStorage() {
    return _singleton;
  }

  SecureStorage._internal();

  final _storage = const FlutterSecureStorage();

  void putJwt(String jwt) async {
    await _storage.write(key: 'jwt', value: jwt);
  }

  String? getJwt() {
    final response = _storage.read(key: 'jwt');
    response.then((onValue) {
      return onValue;
    }).catchError((onError) {
      return null;
    });
    return null;
  }
}
