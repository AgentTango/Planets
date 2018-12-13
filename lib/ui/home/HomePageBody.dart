import 'package:flutter/material.dart';
import 'package:planets/ui/home/PlanetSummary.dart';
import 'package:planets/model/Planets.dart';
import 'package:planets/ui/home/GradientAppBar.dart';


//class HomePageBody extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Expanded(
//      child: new ListView.builder(
//        itemBuilder: (context,index)=>new PlanetRow(PlanetDao.planets[index]),
//        itemCount: PlanetDao.planets.length,
//        padding: new EdgeInsets.symmetric(vertical: 16.0),
//      ),
//    );
//  }
//}
class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        color: new Color(0xFF736AB7),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverFixedExtentList(
                itemExtent: 152.0,
                delegate: new SliverChildBuilderDelegate(
                      (context, index) => new PlanetSummary(PlanetDao.planets[index]),
                  childCount: PlanetDao.planets.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}