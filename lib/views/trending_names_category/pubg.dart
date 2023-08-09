import 'package:flutter/material.dart';

import '../../utils/symbols_list.dart';
import '../custom name screens/custom_name_preview.dart';

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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CustomNamePreview.forAIGenerated(
                                    answer: myTrendingBoysNamePUBG[index],
                                    word: myTrendingBoysNamePUBG[index],
                                    isForAIGenerated: true,
                                    // fontName: fontName,
                                  )));
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CustomNamePreview.forAIGenerated(
                                    answer: myTrendingGirlsNamePUBG[index],
                                    word: myTrendingGirlsNamePUBG[index],
                                    isForAIGenerated: true,
                                    // fontName: fontName,
                                  )));
                    },

                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(myTrendingGirlsNamePUBG[index]),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
