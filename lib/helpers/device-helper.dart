import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<String> getDeviceInfor() async {
  const deviceData = 'deviceData';
  try {
    final sharedPrefs = await SharedPreferences.getInstance();
    String value = '';
    if (!sharedPrefs.containsKey(deviceData)) {
      value = 'yuuuuw';
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
