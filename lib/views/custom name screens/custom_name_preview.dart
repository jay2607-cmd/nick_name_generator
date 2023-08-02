import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';

import '../../database/bookmark.dart';

class CustomNamePreview extends StatefulWidget {
  final String prefix, suffix, word;
  final String answer;
  String fontName;
  CustomNamePreview(
      {super.key,
      required this.answer,
      required this.fontName,
      required this.prefix,
      required this.suffix,
      required this.word});


  @override
  State<CustomNamePreview> createState() => _CustomNamePreviewState();
}

class _CustomNamePreviewState extends State<CustomNamePreview> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Name Preview"),
      ),
      body: Column(
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
                  style: GoogleFonts.getFont(
                    widget.fontName,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
                    Clipboard.setData(
                            new ClipboardData(text: "${widget.answer}"))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Copied to your clipboard !')));
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
      ),
    );
  }
}
