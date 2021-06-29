import 'package:flutter/material.dart';
import 'package:menu_app/burger_page.dart';
import 'dashboard_page.dart';
import 'food_tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashBoardPage(),
    );
  }
}

class DashBoard extends StatefulWidget {
  @override
  State createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
