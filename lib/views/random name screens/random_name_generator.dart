import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  final List<String> symbolsList = symbolsListVariable;

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
          title: Text("Auto Name Generator"),
        ),
        body: ListView.builder(
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              Random random = Random();

              randomPrefixIndex = random.nextInt(symbolsList.length);
              randomSuffixIndex = random.nextInt(symbolsList.length);
              randomFontIndex = random.nextInt(stylishFonts.length);

              String prefix = symbolsList[randomPrefixIndex];
              String suffix = symbolsList[randomSuffixIndex];
              String word = widget.nameController;

              String answer =
                  "${symbolsList[randomPrefixIndex]}${widget.nameController}${symbolsList[randomSuffixIndex]}";

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
                  title: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                          text: "${symbolsList[randomPrefixIndex]} ",
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
                          text: " ${symbolsList[randomSuffixIndex]}",
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
