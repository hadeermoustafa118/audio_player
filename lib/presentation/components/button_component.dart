import 'package:flutter/material.dart';
import '../../core/utils/app_constants.dart';

class ButtonComponent extends StatelessWidget {
    const ButtonComponent({Key? key, required this.onPress , required this.icon}) : super(key: key);
  final IconData icon;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: context.width*0.085,
      child: IconButton(
        icon: Icon(icon),
        iconSize:
        context.width*0.13,
        onPressed: onPress
      ),
    );
  }
}
