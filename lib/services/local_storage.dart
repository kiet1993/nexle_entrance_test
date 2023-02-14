import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _Key {
  token,
  autoLogin,
  username
}

class LocalStorageService extends GetxService {
  SharedPreferences? _sharedPreferences;
  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  String? get token {
    return _sharedPreferences?.getString(_Key.token.toString());
  }

  set token(String? value) {
    if (value != null) {
      _sharedPreferences?.setString(_Key.token.toString(), value);
    } else {
      _sharedPreferences?.remove(_Key.token.toString());
    }
  }

  bool get isAutoLogin {
    return _sharedPreferences?.getBool(_Key.autoLogin.toString()) ?? false;
  }

  set isAutoLogin(bool? value) {
    if (value != null) {
      _sharedPreferences?.setBool(_Key.autoLogin.toString(), value);
    } else {
      _sharedPreferences?.remove(_Key.autoLogin.toString());
    }
  }

  String? get username {
    return _sharedPreferences?.getString(_Key.username.toString());
  }

  set username(String? value) {
    if (value != null) {
      _sharedPreferences?.setString(_Key.username.toString(), value);
    } else {
      _sharedPreferences?.remove(_Key.username.toString());
    }
  }
}
