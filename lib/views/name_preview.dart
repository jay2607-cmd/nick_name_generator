import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';

import '../database/bookmark.dart';

class NamePreview extends StatefulWidget {
  final String answer;
  TextStyle textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  NamePreview({super.key, required this.answer, required this.textStyle});

  @override
  State<NamePreview> createState() => _NamePreviewState();
}

class _NamePreviewState extends State<NamePreview> {

  Box<Bookmark> bookmarkBox = Hive.box<Bookmark>('bookmark');
  var isBookmarked;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isBookmarked = bookmarkBox.values
        .any((bookmark) => bookmark.name == widget.answer);
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
          Text(
            widget.answer,
            style: widget.textStyle,
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
                    bookmarkBox.deleteAt(bookmarkBox.values
                        .toList()
                        .indexWhere((bookmark) =>
                    bookmark.name == widget.answer));
                    print(isBookmarked);
                  } else {
                    bookmarkBox
                        .add(Bookmark(name: widget.answer));
                    print(isBookmarked);

                  }
                  // Update the UI by calling setState
                  setState(() {

                  });
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
