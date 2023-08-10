import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../../utils/symbols_list.dart';
import '../custom name screens/custom_name_generator.dart';
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
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              child: IconButton(
                icon: Image.asset(
                  'assets/images/back.png',
                  height: 24,
                  width: 24,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          title: Container(
              child: Text(
            "PUBG Trending Names",
            style: kAppbarStyle
          )),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: backgroundUI, borderRadius: BorderRadius.circular(10)),
              child: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.black,
                indicator: MyTabIndicator(overlayColor: Colors.white),
                padding: EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                tabs: [
                  Tab(
                    child: Text("PUBG Boys Names",style: kNoneStyle,),
                  ),
                  Tab(
                    child: Text("PUBG Girls Names",style: kNoneStyle,),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: TabBarView(
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
                        title: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backgroundUI,
                            ),
                            padding: EdgeInsets.all(16),
                            child: Center(
                                child: Text(myTrendingBoysNamePUBG[index]))),
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
                        title: Container(decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: backgroundUI,
                        ),
                            padding: EdgeInsets.all(16),child: Center(child: Text(myTrendingGirlsNamePUBG[index]))),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
