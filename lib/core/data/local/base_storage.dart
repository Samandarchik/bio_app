abstract class BaseStorage {
  Future<void> putString({required String key, required String value});
  Future<void> putInt({required String key, required int value});
  String getString({required String key});
  Future<void> remove({required String key});
  Future<void> clear();
  Future<void> putBool({required String key, required bool value});
  bool getBool({required String key});
}
