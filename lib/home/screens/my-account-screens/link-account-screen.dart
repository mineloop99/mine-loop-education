import 'package:flutter/material.dart';

class LinkAccountScreen extends StatelessWidget {
  final listCountry = ["FaceBook", "Google Account"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Link Account"),
      ),
      body: ListView.builder(
        itemCount: listCountry.length,
        itemBuilder: (ctx, i) => ListTile(
          leading: Icon(Icons.border_all),
          title: Text(listCountry[i]),
          onTap: () {},
        ),
      ),
    );
  }
}
