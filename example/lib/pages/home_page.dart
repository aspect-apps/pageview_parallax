import 'package:jramogh/pages/introduction.dart';
import 'package:jramogh/tabs/about_tab.dart';
import 'package:jramogh/tabs/projects_tab.dart';
import 'package:jramogh/widgets/flutter_parallax.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<Widget> tabWidgets = <Widget>[
    AboutTab(),
    Introduction(),
    ProjectsTab(),
    // ProjectsTab(),
    // ProjectsTab(),
    // ProjectsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterParallax(
        screens: tabWidgets,
        backgroundImage: AssetImage(
          'assets/background1.jpg',
        ),
      ),
    );
  }
}
