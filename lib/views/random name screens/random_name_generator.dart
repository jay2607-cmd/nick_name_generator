import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import '../../utils/symbols_list.dart';
import '../custom name screens/custom_name_preview.dart';

class RandomNameGenerator extends StatefulWidget {
  final String nameController;
  const RandomNameGenerator({super.key, required this.nameController});

  @override
  State<RandomNameGenerator> createState() => _RandomNameGeneratorState();
}

class _RandomNameGeneratorState extends State<RandomNameGenerator> {
  int randomPrefixIndex = 0;
  int randomSuffixIndex = 0;
  int randomFontIndex = 0;



  final List<String> myPrefixList = prefixList;
  final List<String> mySuffixList = suffixList;


  String prefix = "";
  String suffix = "";

  final List<String> stylishFonts = fontNameList;

  @override
  void initState() {
    super.initState();
  }

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
              "Auto Name Generator",
              style: kAppbarStyle,
            ),
          ),
        ),

        body: ListView.builder(
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              Random random = Random();

              randomPrefixIndex = random.nextInt(myPrefixList.length);
              randomSuffixIndex = random.nextInt(mySuffixList.length);
              randomFontIndex = random.nextInt(stylishFonts.length);

              String prefix = myPrefixList[randomPrefixIndex];
              String suffix = mySuffixList[randomSuffixIndex];
              String word = widget.nameController;

              String answer =
                  "${myPrefixList[randomPrefixIndex]}${widget.nameController}${mySuffixList[randomSuffixIndex]}";

              String fontName = stylishFonts[randomFontIndex];

              print("$randomPrefixIndex  $randomSuffixIndex $randomFontIndex ");

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomNamePreview(
                        prefix: prefix,
                        suffix: suffix,
                        word: word,
                        answer: answer,
                        fontName: fontName,
                      ),
                    ),
                  );
                },
                child: ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: circleAvatarUI,
                    ),
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: RichText(

                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text: "${myPrefixList[randomPrefixIndex]} ",
                            ),
                            TextSpan(
                              text: widget.nameController,
                              style: GoogleFonts.getFont(
                                fontName,
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ), // Customize the name style here.
                            ),
                            TextSpan(
                              text: " ${mySuffixList[randomSuffixIndex]}",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
