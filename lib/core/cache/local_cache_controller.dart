
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/enums/cache_enums.dart';

class LocalCache {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setInt(CacheEnum key,int value) async => await _prefs?.setInt(key.name, value);
  static Future<void> setBool(CacheEnum key,bool value) async => await _prefs?.setBool(key.name, value);
  static Future<void> setDouble(CacheEnum key,double value) async => await _prefs?.setDouble(key.name, value);
  static Future<void> setString(CacheEnum key,String value) async => await _prefs?.setString(key.name, value);
  static Future<void> setStringList(CacheEnum key,List<String> value) async => await _prefs?.setStringList(key.name, value);

  static int? getInt(CacheEnum key) => _prefs?.getInt(key.name);
  static bool? getBool(CacheEnum key) => _prefs?.getBool(key.name);
  static double? getDouble(CacheEnum key) => _prefs?.getDouble(key.name);
  static String? getString(CacheEnum key) => _prefs?.getString(key.name);
  static List<String>? getStringList(CacheEnum key) => _prefs?.getStringList(key.name);

  static Future<bool?> removeKey(CacheEnum key) async => await _prefs?.remove(key.name);
  static Future<bool?> clear() async => await _prefs?.clear();


}

