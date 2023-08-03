import 'package:flutter/material.dart';

import '../../utils/symbols_list.dart';
import '../custom name screens/custom_name_preview.dart';

class FreeFire extends StatefulWidget {
  const FreeFire({super.key});

  @override
  State<FreeFire> createState() => _FreeFireState();
}

class _FreeFireState extends State<FreeFire> {

  List<String> myTrendingNameFreeFireBoys = trendingBoysNameFreeFire;
  List<String> myTrendingNameFreeFireGirls = trendingGirlsNameFreeFire;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Trending Free Fire Boys Names"),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Trending Free Fire Boys Names"),
              ), Tab(
                child: Text("Trending Free Fire Boys Names"),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [

          ListView.builder(
              itemCount: trendingBoysNameFreeFire.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CustomNamePreview.forAIGenerated(
                                  answer: trendingBoysNameFreeFire[index],
                                  word: trendingBoysNameFreeFire[index],
                                  isForAIGenerated: true,
                                  // fontName: fontName,
                                )));
                  },

                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(trendingBoysNameFreeFire[index]),
                    ),
                  ),
                );
              }),

          ListView.builder(
              itemCount: myTrendingNameFreeFireGirls.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CustomNamePreview.forAIGenerated(
                                  answer: myTrendingNameFreeFireGirls[index],
                                  word: myTrendingNameFreeFireGirls[index],
                                  isForAIGenerated: true,
                                  // fontName: fontName,
                                )));
                  },

                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(myTrendingNameFreeFireGirls[index]),
                    ),
                  ),
                );
              }),
        ]),
      ),
    );
  }
}
