//@dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StatsScreen extends StatefulWidget {
  final String name;
  final int count;
  const StatsScreen({Key key, @required this.name, @required this.count})
      : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  //String name= widget.name;
  //final int count;
  Widget build(BuildContext context) {
    return Container();
  }
}

class stats {
  final String name;
  final int count;
  final charts.Color color;
  stats(this.name, this.count, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
