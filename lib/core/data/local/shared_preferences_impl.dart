import 'package:bio_app/core/data/local/base_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class SharedPreferencesImpl implements BaseStorage {
  final SharedPreferences _pref;

  SharedPreferencesImpl(this._pref);

  @override
  Future<void> clear() async {
    await _pref.clear();
  }

  @override
  String getString({required String key}) {
    return _pref.getString(key) ?? '';
  }

  @override
  Future<void> putString({required String key, required String value}) async {
    await _pref.setString(key, value);
  }

  @override
  Future<void> remove({required String key}) async {
    await _pref.remove(key);
  }

  @override
  bool getBool({required String key}) {
    return _pref.getBool(key) ?? false;
  }

  @override
  Future<void> putBool({required String key, required bool value}) {
    return _pref.setBool(key, value);
  }

  @override
  Future<void> putInt({required String key, required int value}) {
    return _pref.setInt(key, value);
  }
}
