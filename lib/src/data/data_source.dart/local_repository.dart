import 'dart:convert';
import 'package:remedio_da_hora/src/interfaces/base_repository_interface.dart';
import 'package:remedio_da_hora/src/utils/debug_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository implements BaseRepository {
  late SharedPreferences _sharedPreferences;

  LocalRepository() : super() {
    SharedPreferences.getInstance().then((value) => _sharedPreferences = value);
  }

  @override
  Future get(String key) async {
    return _sharedPreferences.get(key);
  }

  @override
  Future<List> getAll() async {
    // _sharedPreferences.clear();
    var listObjects = _sharedPreferences.getKeys();
    var listJson = [];

    for (var objectName in listObjects) {
      listJson.add(jsonDecode(_sharedPreferences.getString(objectName)!));
    }

    return listJson;
  }

  @override
  Future post(String key, object) async {
    DebugUtils.inspec(object);
    _sharedPreferences.setString(key, object.toString());
  }

  @override
  Future put(String key, object) async {
    _sharedPreferences.setString(key, object.toString());
  }

  @override
  Future delete(String key) async {
    _sharedPreferences.remove(key);
  }
}
