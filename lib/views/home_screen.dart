import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nick_name/views/custom%20name%20screens/custom_input_name_home.dart';
import 'package:nick_name/views/bookmarkes_names.dart';
import 'package:nick_name/views/trending_names.dart';
import 'package:nick_name/views/random%20name%20screens/random_input_name_home.dart';
import 'package:nick_name/views/trending_names_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isForRandom = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomInputNameHome()));
              },
              child: Text("Custom Name Generator"),
            ),

            ElevatedButton(
              onPressed: () {
                isForRandom = true;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RandomInputNameHome()));
              },
              child: Text("Auto Name Generator"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TrendingNamesHomeScreen()));
              },
              child: Text("Trending"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BookmarkedNames()));
              },
              child: Text("Saved Names"),
            ),
          ],
        ),
      ),
    );
  }
}
