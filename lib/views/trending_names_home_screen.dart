import 'package:flutter/material.dart';
import 'package:nick_name/views/trending_names_category/cod.dart';
import 'package:nick_name/views/trending_names_category/free_fire.dart';
import 'package:nick_name/views/trending_names_category/pubg.dart';
import 'package:nick_name/views/trending_names_category/valorent.dart';

class TrendingNamesHomeScreen extends StatefulWidget {
  const TrendingNamesHomeScreen({super.key});

  @override
  State<TrendingNamesHomeScreen> createState() =>
      _TrendingNamesHomeScreenState();
}

class _TrendingNamesHomeScreenState extends State<TrendingNamesHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Category"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Pubg()));
            },
            child: Text("PUBG"),
          ),ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FreeFire()));
            },
            child: Text("Free Fire"),
          ),ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Cod()));
            },
            child: Text("COD"),
          ),ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Valorent()));
            },
            child: Text("Valorent"),
          ),
        ],
      ),
    );
  }
}
