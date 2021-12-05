import 'package:e_commerce_app/routes/router.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ).copyWith(colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.orangeAccent)),
      initialRoute: RouteName.homeScreen,
      onGenerateRoute: Router_control.generateRoute,
    );
  }
}

