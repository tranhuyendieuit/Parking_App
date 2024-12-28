import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/shared_preferences_key.dart';

class SharedPrefer {
  static final SharedPrefer sharedPrefer = SharedPrefer._internal();

  factory SharedPrefer() {
    return sharedPrefer;
  }

  SharedPrefer._internal();

  late SharedPreferences _prefsInstance;
  Future<SharedPreferences> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
    return _prefsInstance;
  }

  Future<void> setUserToken(String value) async {
    await _prefsInstance.setString(SharedPreferencesKey.accessToken, value);
  }

  String getUserToken() {
    return _prefsInstance.getString(SharedPreferencesKey.accessToken) ?? "";
  }



}