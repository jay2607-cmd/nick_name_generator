import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';

import '../../utils/constant.dart';
import '../../database/bookmark.dart';

class CustomNamePreview extends StatefulWidget {
  String prefix = "", suffix = "", word = "";
  String answer;
  String fontName = 'Pacifico';
  bool isForAIGenerated = false;
  CustomNamePreview(
      {super.key,
      required this.answer,
      required this.fontName,
      required this.prefix,
      required this.suffix,
      required this.word});

  CustomNamePreview.forAIGenerated(
      {super.key,
      required this.answer,
      required this.word,
      required this.isForAIGenerated
      // required this.fontName,
      });

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
            "Name Preview",
            style: kAppbarStyle,
          ),
        ),
      ),
      body: namePreviewBuildColumn(context),
    );
  }

  Column namePreviewBuildColumn(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 16.0, bottom: 16, left: 16, right: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF8F8FA),
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: DottedBorder(
                borderType: BorderType.RRect,
                strokeWidth: 2.5,
                radius: const Radius.circular(10),
                strokeCap: StrokeCap.round,
                dashPattern: const [5, 10],
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: [
                        TextSpan(
                          text: widget.prefix,
                        ),
                        TextSpan(
                          text: widget.word,

                          style: !widget.isForAIGenerated
                              ? TextStyle(
fontFamily: widget.fontName
                          )
                              : TextStyle(

                                ), // Customize the name style here.
                        ),
                        TextSpan(
                          text: widget.suffix,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: circleAvatarUI,
              child: Container(
                height: 70,
                width: 70,
                child: IconButton(
                  onPressed: () {
                    Clipboard.setData(
                            new ClipboardData(text: "${widget.answer}"))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 1),
                        content: Text('Copied to your clipboard !'),
                      ));
                    });
                  },
                  icon: Image.asset(
                    "assets/images/copy.png",
                  ),
                ),
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: circleAvatarUI,
              child: Container(
                height: 55,
                width: 55,
                child: IconButton(
                    onPressed: () {
                      Share.share('${widget.answer}',
                          subject: 'Sharing from Nick Name');
                    },
                    icon: Image.asset(
                      'assets/images/share.png',
                    )),
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: circleAvatarUI,
              child: Container(
                height: 55,
                width: 55,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      'assets/images/edit.png',
                    )),
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: circleAvatarUI,
              child: Container(
                height: 55,
                width: 55,
                child: IconButton(
                  onPressed: () {
                    if (isBookmarked) {
                      bookmarkBox.deleteAt(bookmarkBox.values
                          .toList()
                          .indexWhere(
                              (bookmark) => bookmark.name == widget.answer));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Bookmark Removed'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 1),
                      ));

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
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Bookmarked Saved'),
                        backgroundColor: Colors.blue,
                        duration: Duration(seconds: 1),
                      ));
                      print(isBookmarked);
                    }
                    // Update the UI by calling setState
                    setState(() {});
                  },
                  icon: isBookmarked
                      ? Image.asset(
                          'assets/images/fav.png',
                        )
                      : Image.asset(
                          'assets/images/unfav.png',
                        ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
