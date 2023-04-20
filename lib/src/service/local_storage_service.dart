import 'package:remedio_da_hora/src/interfaces/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService implements ILocalStorage {
  @override
  Future get(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);


  }

  @override
  Future put(String key, value) async {
    var shared = await SharedPreferences.getInstance();

    var optionType = {
      bool: shared.setBool(key, value),
      String: shared.setString(key, value),
      int: shared.setInt(key, value),
      double: shared.setDouble(key, value),
    };

    optionType[value];
  }

  @override
  Future delete(String key) async {
    var shared = await SharedPreferences.getInstance();

    shared.remove(key);
  }
}
