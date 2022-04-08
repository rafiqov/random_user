import 'package:get_storage/get_storage.dart';

enum StorageKeys {
  uid,
  token,
}

class GetStorageDB {
  static Future<void> init() async => await GetStorage.init();
  static final box = GetStorage();

  static store(StorageKeys key, String data) async {
    await box.write(_getKey(key), data);
  }

  static String? load(StorageKeys key) {
    return box.read(_getKey(key));
  }

  static Future<void> remove(StorageKeys key) async {
    await box.remove(_getKey(key));
  }

  static String _getKey(StorageKeys key) {
    switch (key) {
      case StorageKeys.uid:
        return "uid";
      case StorageKeys.token:
        return "token";
    }
  }
}
