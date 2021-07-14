import 'package:flutter/material.dart';

class DarkScreenModeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 6,
          child: SwitchListTile(
            value: true,
            title: Row(
              children: [
                Icon(Icons.nights_stay),
                SizedBox(width: 5),
                Text("Dark Mode"),
              ],
            ),
            onChanged: (_) {},
          )),
    );
  }
}
