import 'package:flutter/material.dart';

class LanguageSettingScreen extends StatelessWidget {
  final listCountry = ['English', 'Tiếng Việt'];
  final listAssetImagePath = [
    'icons/flags/png/us.png',
    'icons/flags/png/vn.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language Setting"),
      ),
      body: ListView.builder(
        itemCount: listCountry.length,
        itemBuilder: (ctx, i) => ListTile(
          leading: Image.asset(
            listAssetImagePath[i],
            package: 'country_icons',
            width: 50,
            height: 50,
          ),
          title: Text(listCountry[i]),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
