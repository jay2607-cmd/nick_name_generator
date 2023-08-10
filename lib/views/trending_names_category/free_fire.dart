import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../../utils/symbols_list.dart';
import '../custom name screens/custom_name_generator.dart';
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
            "Free Fire Trending Names",
            style: kAppbarStyle,
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
                    child: Text("Free Fire Boy Names",style: kNoneStyle,),
                  ),
                  Tab(
                    child: Text("Free Fire Girl Names",style: kNoneStyle,),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: TabBarView(children: [
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
                      title: Container(decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: backgroundUI,
                      ),
                          padding: EdgeInsets.all(16),child: Center(child: Text(trendingBoysNameFreeFire[index]))),
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
                      title: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: backgroundUI,
                          ),
                          padding: EdgeInsets.all(16),
                          child: Center(
                              child:
                                  Text(myTrendingNameFreeFireGirls[index]))),
                    ),
                  );
                }),
          ]),
        ),
      ),
    );
  }
}
