import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../database/bookmark.dart';
import 'custom name screens/custom_name_preview.dart';

class BookmarkedNames extends StatefulWidget {
  const BookmarkedNames({super.key});

  @override
  State<BookmarkedNames> createState() => _BookmarkedNamesState();
}

class _BookmarkedNamesState extends State<BookmarkedNames> {
  Box<Bookmark> bookmarkBox = Hive.box<Bookmark>('bookmark');

  @override
  Widget build(BuildContext context) {
    List<Bookmark> bookmarkedNames = bookmarkBox.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Names"),
      ),
      body: bookmarkedNames.isEmpty
          ? Center(child: Text("No Saved Names"))
          : ListView.builder(
              itemCount: bookmarkBox.length,
              itemBuilder: (BuildContext context, int index) {
                String savedNames = bookmarkedNames[index].name;
                String fontName = bookmarkedNames[index].fontName;
                String prefix = bookmarkedNames[index].prefix;
                String suffix = bookmarkedNames[index].suffix;
                String word = bookmarkedNames[index].word;
                bool isAIGenerated = bookmarkedNames[index].isAIGenerated;

                bool isBookmarked = bookmarkBox.values
                    .any((bookmark) => bookmark.name == savedNames);

                return GestureDetector(
                  onTap: () {
                    if (isAIGenerated) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CustomNamePreview.forAIGenerated(
                                    answer: savedNames,
                                    word: word,
                                    isForAIGenerated: isAIGenerated,
                                  )));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomNamePreview(
                                    answer: savedNames,
                                    fontName: fontName,
                                    prefix: prefix,
                                    suffix: suffix,
                                    word: word,
                                  )));
                    }
                  },
                  child: ListTile(
                    title: Center(
                        child: Text(
                      savedNames,
                      style: !isAIGenerated
                          ? GoogleFonts.getFont(
                              fontName,
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : null,
                    )),
                  ),
                );
              },
            ),
    );
  }
}
