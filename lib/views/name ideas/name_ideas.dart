import 'package:flutter/material.dart';
import 'package:nick_name/views/custom%20name%20screens/custom_name_generator.dart';

import '../../utils/constant.dart';
import '../../utils/symbols_list.dart';
import '../custom name screens/custom_name_preview.dart';
import '../random name screens/random_name_generator.dart';

class NameIdeas extends StatefulWidget {
  const NameIdeas({super.key});

  @override
  NameIdeasState createState() => NameIdeasState();
}

class NameIdeasState extends State<NameIdeas> {
  var answer = "Name Ideas";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                margin: EdgeInsets.only(bottom: 235),
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
                margin: EdgeInsets.only(bottom: 235),
                child: Text(
                  "Name Ideas",
                  style:kAppbarStyle
                )),

            toolbarHeight: 285,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backgroundUI,
                            ),
                            width: double.infinity,
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                CustomNamePreview.forAIGenerated(
                                        answer: answer,
                                        word: answer,
                                        isForAIGenerated: true)
                                    .answer,
                                style: TextStyle(
                                    fontSize: 23, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: circleAvatarUI,
                              child: Container(
                                height: 45,
                                width: 45,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomNameGenerator(
                                                      nameController: answer)));
                                    },
                                    icon: Image.asset(
                                      'assets/images/edit.png',
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: circleAvatarUI,
                              child: Container(
                                height: 45,
                                width: 45,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RandomNameGenerator(
                                                    nameController: answer,
                                                  )));
                                    },
                                    icon: Image.asset(
                                      'assets/images/auto.png',
                                    )),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: backgroundUI,
                      borderRadius: BorderRadius.circular(10)),
                  child: TabBar(
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.black,
                    indicator: MyTabIndicator(overlayColor: Colors.white),
                    padding: EdgeInsets.symmetric(
                      horizontal: 2,
                    ),
                    isScrollable: true,
                    tabs: [
                      buildTab("MIX NAMES"),
                      buildTab("GIRLS NAMES"),
                      buildTab("GAME WEAPON NAMES"),
                      buildTab("MILITARY NAME IDEA"),
                      buildTab("ANIMALS NAME"),
                      buildTab("SCIENCE LABS"),
                    ],
                  ),
                ),
              ],
            ),
            // title: const Text("Name Ideas"),
          ),
          body: TabBarView(
            children: [
              buildListView(mixNames),
              buildListView(girlsNamesFromDifferentCountries),
              buildListView(weaponNames),
              buildListView(militaryNames),
              buildListView(animalsFromDifferentCountries),
              buildListView(scienceTermsFromDifferentCountries),
            ],
          ),
        ),
      ),
    );
  }

  Tab buildTab(String title) {
    return Tab(
      child: Text(title,style: kNoneStyle,),
    );
  }

  buildListView(List<String> name) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: name.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => CustomNamePreview.forAIGenerated(
                //               answer: name[index],
                //               word: name[index],
                //               isForAIGenerated: true,
                //               // fontName: fontName,
                //             )));
                answer = name[index];
                setState(() {});
              },
              child: ListTile(
                title: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: backgroundUI,
                    ),
                    padding: EdgeInsets.all(16),
                    child: Center(child: Text(name[index]))),
              ),
            );
          }),
    );
  }
}
