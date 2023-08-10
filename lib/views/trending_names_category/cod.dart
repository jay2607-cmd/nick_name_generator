import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../../utils/symbols_list.dart';
import '../custom name screens/custom_name_preview.dart';

class Cod extends StatefulWidget {
  const Cod({super.key});

  @override
  State<Cod> createState() => _CodState();
}

class _CodState extends State<Cod> {
  List<String> myTrendingNameCOD = trendingCODNames;

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
            "COD Trending Names",
            style: kAppbarStyle,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: myTrendingNameCOD.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CustomNamePreview.forAIGenerated(
                              answer: myTrendingNameCOD[index],
                              word: myTrendingNameCOD[index],
                              isForAIGenerated: true,
                              // fontName: fontName,
                            )));
              },
              child: ListTile(
                title: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: circleAvatarUI,
                    ),
                    padding: EdgeInsets.all(16),
                    child: Center(child: Text(myTrendingNameCOD[index]))),
              ),
            );
          }),
    );
  }
}
