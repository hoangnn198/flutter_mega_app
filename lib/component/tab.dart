import 'package:flutter/material.dart';
import 'package:flutter_app/component/home.dart';
import 'package:flutter_app/component/login.dart';
import 'package:flutter_app/component/person.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Tabs(),
    ),
  ));
}

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomTab();
  }
}

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab>
    with SingleTickerProviderStateMixin {
  late TabController controller = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Material(
          color: Colors.blue,
          child: TabBar(
            tabs: const <Tab>[
              Tab(
                icon: Icon(Icons.person),
              ),
              Tab(
                icon: Icon(Icons.email),
              ),
            ],
            controller: controller,
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: const <Widget>[Home(), Persion()],
        ));
  }
}
