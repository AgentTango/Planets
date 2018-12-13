import 'package:flutter/material.dart';
import 'package:planets/ui/home/GradientAppBar.dart';
import 'HomePageBody.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color(0xFF736AB7),
      body: new Column(
        children: <Widget>[
          new GradientAppBar("tango"),
          new HomePageBody(),
        ],
      ),
    );
  }
}








