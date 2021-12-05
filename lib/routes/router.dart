import 'package:e_commerce_app/screens/home_page.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:e_commerce_app/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class Router_control {
  static Route generateRoute(RouteSettings settings ){
    switch (settings.name) {
      case 'LoginScreen':
        return MaterialPageRoute(builder: (context)=> LoginScreen());
      case 'SignUpScreen':
      return MaterialPageRoute(builder: (context)=> SignUpScreen());
      case 'HomeScreen': 
      return MaterialPageRoute(builder: (context)=>HomePage());
      default:
      return MaterialPageRoute(builder: (_){
        return Scaffold(
          body: Center(child: Text("No route defined for${settings.name}"),),
        );
      });
    }
  }
}