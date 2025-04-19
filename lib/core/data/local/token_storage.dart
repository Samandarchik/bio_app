import 'base_storage.dart';

final class TokenStorage {
  static const String _token = 'access';
  static const String _userId = 'user_id';
  static const String _refreshToken = 'refresh';
  static const String _username = 'username';

  final BaseStorage _baseStorage;

  TokenStorage(this._baseStorage);

  Future<void> putToken(String token) async {
    await _baseStorage.putString(key: _token, value: token);
  }

  Future<void> putUsername(String username) async {
    await _baseStorage.putString(key: _username, value: username);
  }

  Future<void> putUserId(int userId) async {
    await _baseStorage.putInt(key: _userId, value: userId);
  }

  Future<void> putRefreshToken(String refreshToken) async {
    await _baseStorage.putString(key: _refreshToken, value: refreshToken);
  }

  String getToken() {
    return _baseStorage.getString(key: _token);
  }

  String getRefreshToken() {
    return _baseStorage.getString(key: _refreshToken);
  }

  Future<void> removeToken() async {
    await _baseStorage.remove(key: _token);
  }

  Future<void> removeRefreshToken() async {
    await _baseStorage.remove(key: _refreshToken);
  }

  Future<void> putRole(String role) async {
    await _baseStorage.putString(key: "role", value: role);
  }
}
