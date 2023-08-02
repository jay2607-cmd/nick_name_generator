import 'package:flutter/material.dart';

import '../../utils/symbols_list.dart';

class Pubg extends StatefulWidget {
  const Pubg({super.key});

  @override
  State<Pubg> createState() => _PubgState();
}

class _PubgState extends State<Pubg> {

  List<String> myTrendingBoysNamePUBG = trendingBoysNamePUBG;
  List<String> myTrendingGirlsNamePUBG = trendingGirlsNamePUBG;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("PUBG"),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("PUBG Boys Names"),
              ),
              Tab(
                child: Text("PUBG Girls Names"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [

            ListView.builder(
                itemCount: myTrendingBoysNamePUBG.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {

                    },
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(myTrendingBoysNamePUBG[index]),
                      ),
                    ),
                  );
                }),

            ListView.builder(
                itemCount: myTrendingGirlsNamePUBG.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(myTrendingGirlsNamePUBG[index]),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
