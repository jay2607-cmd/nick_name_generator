import 'package:flutter/material.dart';
import 'package:nick_name/utils/symbols_list.dart';

import '../custom name screens/custom_name_preview.dart';

class Valorent extends StatefulWidget {
  const Valorent({super.key});

  @override
  State<Valorent> createState() => _ValorentState();
}

class _ValorentState extends State<Valorent> {
  List<String> myTrendingNameValorent = trendingValorentNames;

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
              itemCount: myTrendingNameValorent.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CustomNamePreview.forAIGenerated(
                                  answer: myTrendingNameValorent[index],
                                  word: myTrendingNameValorent[index],
                                  isForAIGenerated: true,
                                  // fontName: fontName,
                                )));
                  },
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(myTrendingNameValorent[index]),
                    ),
                  ),
                );
              }),
        ]),
      ),
    );
  }
}
