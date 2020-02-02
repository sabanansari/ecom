import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenu(
      {@required this.title,
      @required this.icon,
      @required this.onTap,
      this.colors = Colors.red});

  final String title;
  final IconData icon;
  final Function onTap;
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(title),
        leading: Icon(
          icon,
          color: colors,
        ),
      ),
    );
  }
}
