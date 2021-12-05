import 'package:flutter/material.dart';

class TextChangeScreen extends StatelessWidget {
  final String? what;
  final String? whereTo;
  final Function()? onTap;
  const TextChangeScreen({Key? key, this.what, this.whereTo, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(what!,style:const TextStyle(color: Colors.white),),
        
        GestureDetector(
          onTap: onTap,
          child: Text(
            whereTo!,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
