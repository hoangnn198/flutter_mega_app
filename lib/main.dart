// // ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_app/component/home.dart';
import 'package:flutter_app/component/login.dart';

void main() {
  runApp(const NavigationApp());
}

class NavigationApp extends StatelessWidget {
  // This widget is the root of your application.
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //...
      routes: <String, WidgetBuilder>{
        '/': (context) => const Login(),
        '/b': (context) => const Home(),
      },
      //...
    );
  }
}
