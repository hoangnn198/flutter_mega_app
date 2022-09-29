// // ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_app/component/home.dart';
import 'package:flutter_app/component/login.dart';
import 'package:flutter_app/component/person.dart';
import 'package:flutter_app/component/tab.dart';

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
        '/tab': (context) => const Tabs(),
        '/b': (context) => const Home(),
        '/c': (context) => const Persion(),
      },
      //...
    );
  }
}
