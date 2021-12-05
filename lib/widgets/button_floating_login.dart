import 'package:flutter/material.dart';

class ButtonFloatingLogin extends StatelessWidget {
  final String? text;
  final Function()? onPress;
  const ButtonFloatingLogin({Key? key, this.text, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPress,
        child: Text(
          text!,
          style:const TextStyle(color: Colors.white, fontSize: 20),
        ),
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
            side:const BorderSide(color: Colors.white)));
  }
}
