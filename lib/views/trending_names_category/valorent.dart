import 'package:flutter/material.dart';
import 'package:nick_name/utils/symbols_list.dart';

import '../../utils/constant.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
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
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Valorent Trending Names",
            style: kAppbarStyle,
          ),
        ),
      ),

      body: ListView.builder(
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
                title: Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: circleAvatarUI,
                ),
                    padding: EdgeInsets.all(16),child: Center(child: Text(myTrendingNameValorent[index]))),
              ),
            );
          }),
    );
  }
}
