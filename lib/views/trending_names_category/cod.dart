import 'package:flutter/material.dart';

import '../../utils/symbols_list.dart';

class Cod extends StatefulWidget {
  const Cod({super.key});

  @override
  State<Cod> createState() => _CodState();
}

class _CodState extends State<Cod> {

  List<String> myTrendingNameCOD = trendingCODNames;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Trending PUBG Names"),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("COD Trending Names"),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [

          ListView.builder(
              itemCount: myTrendingNameCOD.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(myTrendingNameCOD[index]),
                  ),
                );
              }),
        ]),
      ),
    );
  }
}
