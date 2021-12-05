import 'package:flutter/material.dart';

class ButtonIntegrated extends StatelessWidget {
  final Function()? onPressed;
  final String? icon;
  const ButtonIntegrated({Key? key, this.icon,this.onPressed}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.001,
            blurRadius: 35
            )
      ]),
      child: IconButton(
        icon: ClipRRect(child: Image.asset(icon!),
        borderRadius: BorderRadius.circular(7 ),),
        onPressed: onPressed,
      ),
    );
  }
}
