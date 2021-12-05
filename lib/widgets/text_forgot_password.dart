import 'package:e_commerce_app/values/app_colors.dart';
import 'package:flutter/material.dart';

class TextForgotPass extends StatelessWidget {
  final Function()? onTap;
  const TextForgotPass({ Key? key, this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Text(
        "Forgot Password?",
        textAlign: TextAlign.right,
                    style: TextStyle(color: AppColors.xanhDam)
      ),
    );
  }
}