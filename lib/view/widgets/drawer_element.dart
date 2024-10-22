import 'package:flutter/material.dart';
import 'package:second_copy_for_azkar_application/statics/statics.dart';

class DrawerElement extends StatelessWidget {
  final String element_text;
  final IconData drawer_element_icon;
  final Function onClick;

  DrawerElement({
    required this.element_text,
    required this.drawer_element_icon,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListTile(
      trailing: Icon(
        drawer_element_icon,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        element_text,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontFamily: 'alfont_com_SakkalKitab',
          fontWeight: FontWeight.w600,
          fontSize: width / 19,
        ),
      ),
      onTap: () {
        print('$element_text clicked!!');
        onClick();
      },
    );
  }
}
