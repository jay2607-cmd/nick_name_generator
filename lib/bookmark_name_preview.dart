import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:nick_name/views/bookmarkes_name.dart';
import 'package:share_plus/share_plus.dart';

import '../../database/bookmark.dart';

class BookmarkNamePreview extends StatefulWidget {
  String prefix = "", suffix = "", word = "";
  String answer;
  String fontName = 'Pacifico';
  bool isForAIGenerated = false;
  BookmarkNamePreview(
      {super.key,
      required this.answer,
      required this.fontName,
      required this.prefix,
      required this.suffix,
      required this.word});

  BookmarkNamePreview.forAIGenerated(
      {super.key,
      required this.answer,
      required this.word,
      required this.isForAIGenerated
      // required this.fontName,
      });

  @override
  State<BookmarkNamePreview> createState() => _BookmarkNamePreviewState();
}

class _BookmarkNamePreviewState extends State<BookmarkNamePreview> {
  Box<Bookmark> bookmarkBox = Hive.box<Bookmark>('bookmark');
  var isBookmarked;
  @override
  void initState() {
    super.initState();
    isBookmarked =
        bookmarkBox.values.any((bookmark) => bookmark.name == widget.answer);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: _willPopCallback,
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Name Preview"),
        ),
        body: namePreviewBuildColumn(context),
      ),
    );
  }

  Column namePreviewBuildColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 23),
            children: [
              TextSpan(
                text: widget.prefix,
              ),
              TextSpan(
                text: widget.word,

                style: !widget.isForAIGenerated
                    ? GoogleFonts.getFont(
                        widget.fontName,
                      )
                    : TextStyle(
                        fontWeight: FontWeight.bold,
                      ), // Customize the name style here.
              ),
              TextSpan(
                text: widget.suffix,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  Clipboard.setData(new ClipboardData(text: "${widget.answer}"))
                      .then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Copied to your clipboard !')));
                  });
                },
                icon: Icon(Icons.copy)),
            IconButton(
                onPressed: () {
                  Share.share('${widget.answer}',
                      subject: 'Sharing from Nick Name');
                },
                icon: Icon(Icons.share)),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.edit)),
            IconButton(
              onPressed: () {
                if (isBookmarked) {
                  bookmarkBox.deleteAt(bookmarkBox.values.toList().indexWhere(
                      (bookmark) => bookmark.name == widget.answer));
                  isBookmarked = false;
                  print(isBookmarked);
                } else {
                  bookmarkBox.add(
                    Bookmark(
                        isAIGenerated: widget.isForAIGenerated,
                        name: widget.answer,
                        fontName: widget.fontName,
                        prefix: widget.prefix,
                        suffix: widget.suffix,
                        word: widget.word),
                  );
                  isBookmarked = true;
                  print(isBookmarked);
                }
                // Update the UI by calling setState
                setState(() {});
              },
              icon: isBookmarked
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
            )
          ],
        )
      ],
    );
  }

  Future<bool> _willPopCallback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BookmarkedNames()));
    return Future.value(true);
  }
}
