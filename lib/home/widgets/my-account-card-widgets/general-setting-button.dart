import 'package:flutter/material.dart';

class GeneralSettingButton extends StatelessWidget {
  final Function onTap;
  final Widget imageLeading;
  final String title;
  final String subTitle;

  const GeneralSettingButton({
    this.title,
    this.subTitle,
    this.imageLeading,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Theme.of(context).bannerTheme.backgroundColor,
      child: ListTile(
        title: Text(
          title,
        ),
        subtitle: Text(
          subTitle,
        ),
        leading: CircleAvatar(
          child: FittedBox(
            fit: BoxFit.cover,
            child: imageLeading,
          ),
        ),
        trailing: Icon(Icons.arrow_right_alt),
        onTap: onTap,
      ),
    );
  }
}
