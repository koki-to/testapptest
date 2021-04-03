import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_redirect/store_redirect.dart';

class Utility {
  static SharedPreferences prefs;
  static String osInfo = "";
  static String appVersion = "";

  static Future init() async {
    prefs = await SharedPreferences.getInstance();

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo _iosInfo = await deviceInfo.iosInfo;
      String _versionInfo = _iosInfo.model +
          '_' +
          _iosInfo.systemName +
          '_' +
          _iosInfo.systemVersion +
          '_Version_' +
          appVersion;
      print('現在の機種は ' + _versionInfo); //iPhone
      osInfo = _versionInfo;
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      String _version = androidInfo.version.release;
      String _sdk = androidInfo.version.sdkInt.toString();
      String _versionInfo = androidInfo.model +
          '_Android_' +
          _version +
          '_SDK_' +
          _sdk +
          '_Version_' +
          appVersion;
      print('現在の機種は ' + _versionInfo); //iPhone
      osInfo = _versionInfo;
    }
  }

  static String formatDateText(DateTime date) {
    return date.year.toString() +
        "/" +
        date.month.toString() +
        "/" +
        date.day.toString();
  }

  // password format check Pass123
  static bool isPassword(String str) {
    if (str == null) return false;
    if (str.length < 6) return false;
    return true;
  }

  static bool isSame(str1, str2) {
    var result = str1.compareTo(str2);
    if (result == 0) {
      return true;
    } else {
      return false;
    }
  }

  static gotoAppStore() {
    const String AndroidAppId = "com.tencent.mm";
    const String iOSAppId = "414478124";
    StoreRedirect.redirect(androidAppId: AndroidAppId, iOSAppId: iOSAppId);
  }
}
