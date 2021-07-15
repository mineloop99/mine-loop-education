import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  List<Map<String, String>> _dropdownListInfo = [
    {
      'countryCode': 'VN',
      'imagePath': 'icons/flags/png/vn.png',
      'label': 'Vietnamese',
    },
    {
      'countryCode': 'US',
      'imagePath': 'icons/flags/png/us.png',
      'label': 'English',
    },
  ];
  List<DropdownMenuItem> get dropdownList {
    return _dropdownListInfo
        .map(
          (country) => dropdownItem(
              country['countryCode'], country['imagePath'], country['label']),
        )
        .toList();
  }

  DropdownMenuItem dropdownItem(
      String _countryCode, String _imagePath, String _label) {
    return new DropdownMenuItem(
      value: _countryCode,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            _imagePath,
            package: 'country_icons',
            width: 20,
            height: 15,
          ),
          const SizedBox(
            width: 10,
            height: 5,
          ),
          Divider(
            thickness: 2,
          ),
          Text(
            _label,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
