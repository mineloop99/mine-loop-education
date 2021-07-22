import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

String generateRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}

Future<String> getDeviceInfor() async {
  const deviceData = 'deviceData';
  try {
    final sharedPrefs = await SharedPreferences.getInstance();
    String value = ""; //generateRandomString(6);
    if (!sharedPrefs.containsKey(deviceData)) {
      value = generateRandomString(6);
      sharedPrefs.setString(
          deviceData,
          json.encode(
            {'device_unique_id': value},
          ));
    }
    if (value.isEmpty) {
      value =
          json.decode(sharedPrefs.getString(deviceData))['device_unique_id'];
    }
    return value;
  } catch (err) {
    throw err;
  }
}
