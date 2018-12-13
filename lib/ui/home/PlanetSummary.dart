//import 'package:flutter/material.dart';
//import 'package:planets/model/Planet.dart';
//
//class PlanetRow extends StatelessWidget {
//  final Planet planet;
//
//  PlanetRow(this.planet);
//
//  @override
//  Widget build(BuildContext context) {
//    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
//    final headerTextStyle = baseTextStyle.copyWith(
//        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);
//    final regularTextStyle = baseTextStyle.copyWith(
//        color: const Color(0xffb6b2df),
//        fontSize: 9.0,
//        fontWeight: FontWeight.w400);
//    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
//
//    Widget _planetValue({String value, String image}) {
//      return new Row(children: <Widget>[
//        new Image.asset(image, height: 12.0),
//        new Container(width: 8.0),
//        new Text(planet.gravity, style: regularTextStyle),
//      ]);
//    }
//
//    final planetCardContent = new Container(
//      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
//      constraints: new BoxConstraints.expand(),
//      child: new Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          new Container(height: 4.0),
//          new Text(
//            planet.name,
//            style: headerTextStyle,
//          ),
//          new Container(height: 10.0),
//          new Text(planet.location, style: subHeaderTextStyle),
//          new Container(
//              margin: new EdgeInsets.symmetric(vertical: 8.0),
//              height: 2.0,
//              width: 18.0,
//              color: new Color(0xff00c6ff)),
//          new Row(
//            children: <Widget>[
//              new Image.asset("assets/img/ic_distance.png", height: 12.0),
//              new Container(width: 8.0),
//              new Text(
//                planet.distance,
//                style: regularTextStyle,
//              ),
//              new Container(width: 24.0),
//              new Image.asset("assets/img/ic_gravity.png", height: 12.0),
//              new Container(width: 8.0),
//              new Text(
//                planet.gravity,
//                style: regularTextStyle,
//              ),
//            ],
//          ),
//        ],
//      ),
//    );
//
//    final planetThumbnail = new Container(
//      margin: EdgeInsets.symmetric(
//        vertical: 16.0,
//      ),
//      alignment: FractionalOffset.centerLeft,
//      child: new Image(
//        image: new AssetImage(planet.image),
//        height: 92.0,
//        width: 92.0,
//      ),
//    );
//
//    final planetCard = new Container(
//      height: 124.0,
//      margin: new EdgeInsets.only(left: 46.0),
//      decoration: new BoxDecoration(
//          color: new Color(0xFF333366),
//          shape: BoxShape.rectangle,
//          borderRadius: new BorderRadius.circular(8.0),
//          boxShadow: <BoxShadow>[
//            new BoxShadow(
//              color: Colors.black12,
//              blurRadius: 10.0,
//              offset: new Offset(0.0, 10.0),
//            )
//          ]),
//    );
//
//    return new Container(
//      margin: const EdgeInsets.symmetric(
//        vertical: 16.0,
//        horizontal: 24.0,
//      ),
//      child: new Stack(
//        children: <Widget>[
//          planetCard,
//          planetThumbnail,
//        ],
//      ),
//    );
//  }
//}
import 'package:flutter/material.dart';
import 'package:planets/ui/PlanetDetail/DetailPage.dart';
import 'package:planets/model/Planet.dart';

class PlanetSummary extends StatelessWidget {
  final Planet planet;
  final bool horizontal;

  PlanetSummary(this.planet, {this.horizontal = true});

  PlanetSummary.vertical(this.planet) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
//      alignment: FractionalOffset.centerLeft,
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: "planet-hero-${planet.id}",
        child: new Image(
          image: new AssetImage(planet.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);

    Widget _planetValue({String value, String image}) {
      return new Row(children: <Widget>[
        new Image.asset(image, height: 12.0),
        new Container(width: 8.0),
        new Text(planet.gravity, style: regularTextStyle),
      ]);
    }

    final planetCardContent = new Container(
//      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(planet.name, style: headerTextStyle),
          new Container(height: 10.0),
          new Text(planet.location, style: subHeaderTextStyle),
          new Separator(),
//          new Container(
//              margin: new EdgeInsets.symmetric(vertical: 8.0),
//              height: 2.0,
//              width: 18.0,
//              color: new Color(0xff00c6ff)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: planet.distance,
                      image: 'assets/img/ic_distance.png')),
              new Container(
                width: 32.0,
              ),
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: planet.gravity,
                      image: 'assets/img/ic_gravity.png'))
            ],
          ),
        ],
      ),
    );

    final planetCard = new Container(
      child: planetCardContent,
//      height: 124.0,
//      margin: new EdgeInsets.only(left: 46.0),
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new GestureDetector(
//      onTap: () => Navigator.of(context).push(new PageRouteBuilder(
//            pageBuilder: (_, __, ___) => new DetailPage(planet),
//          )),
      onTap: horizontal
          ? () => Navigator.of(context).push(
                new PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new DetailPage(planet),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          new FadeTransition(opacity: animation, child: child),
                ),
              )
          : null,
      child: new Container(
//          height: 120.0,
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              planetCard,
              planetThumbnail,
            ],
          )),
    );
  }
}
