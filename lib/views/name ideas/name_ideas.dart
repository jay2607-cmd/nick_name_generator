import 'package:flutter/material.dart';
import 'package:nick_name/views/custom%20name%20screens/custom_name_generator.dart';

import '../../utils/symbols_list.dart';
import '../custom name screens/custom_name_preview.dart';
import '../random name screens/random_name_generator.dart';

class NameIdeas extends StatefulWidget {
  const NameIdeas({super.key});

  @override
  NameIdeasState createState() => NameIdeasState();
}

class NameIdeasState extends State<NameIdeas> {
  var answer = "Demo Text";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          toolbarHeight: 200,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      CustomNamePreview.forAIGenerated(
                              answer: answer,
                              word: answer,
                              isForAIGenerated: true)
                          .answer,
                      style: TextStyle(fontSize: 23),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CustomNameGenerator(
                                          nameController: answer)));
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RandomNameGenerator(
                                            nameController: answer,
                                          )));
                            },
                            icon: Icon(Icons.newspaper)),
                      ],
                    )
                  ],
                ),
              ),
              TabBar(
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
    );
  }

  Tab buildTab(String title) {
    return Tab(
      child: Text(title),
    );
  }

  ListView buildListView(List<String> name) {
    return ListView.builder(
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
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(name[index]),
              ),
            ),
          );
        });
  }
}
