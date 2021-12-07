import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextProductName extends StatelessWidget {
  String productName;
  TextProductName({Key? key, required this.productName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        productName,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
        
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        
      ),
    );
  }
}
