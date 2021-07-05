import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/language.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key key}) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String _languageSelected;
  @override
  Widget build(BuildContext context) {
    return Consumer<Language>(
      builder: (context, language, child) => DropdownButton(
        hint: Row(children: [
          Icon(
            Icons.language,
          ),
          Text('Chosse Language',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
              )),
        ]),
        value: _languageSelected,
        onChanged: (languagueSelected) {
          setState(() {
            _languageSelected = languagueSelected;
          });
        },
        items: language.dropdownList,
      ),
    );
  }
}
