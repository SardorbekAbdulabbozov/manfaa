import 'package:hive/hive.dart';
import 'package:manfaa/core/keys/keys.dart';

class Storage {
  late Box _box;

  static Storage? _instance;

  static Storage get instance => _instance!;

  static Future<Storage> init() async {
    _instance = Storage();
    _instance!._box = await Hive.openBox('manfaa');
    return _instance!;
  }

  Future<void> clearStorage() async {
    await _box.clear();
  }

  String getLocale() {
    return _box.get(Keys.locale, defaultValue: "en") ?? "en";
  }

  Future<void> setLocale(String locale) async {
    await _box.put(Keys.locale, locale);
  }
}
