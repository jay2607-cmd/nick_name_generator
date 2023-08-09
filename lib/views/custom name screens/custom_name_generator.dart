import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:nick_name/constant.dart';
import 'package:nick_name/utils/symbols_list.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_name_preview.dart';

class CustomNameGenerator extends StatefulWidget {
  String nameController = "";
  CustomNameGenerator({super.key, required this.nameController});

  @override
  State<CustomNameGenerator> createState() => _CustomNameGeneratorState();
}

class _CustomNameGeneratorState extends State<CustomNameGenerator> {
  final myPrefixList = prefixList;
  final mySuffixList = suffixList;

  String prefix = "";
  String suffix = "";

  String fontNameGlobal = "Montserrat";

  final List<String> stylishFonts = fontNameList;

  String name = "";
  @override
  void initState() {
    super.initState();
    name = widget.nameController;
  }

  @override
  Widget build(BuildContext context) {
    String answer = "$prefix $name $suffix";
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                margin: EdgeInsets.only(bottom: 172),
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
            ),
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(
                  top: 80.0, bottom: 16, left: 16, right: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundUI,
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
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          children: [
                            TextSpan(
                              text: prefix,
                            ),
                            TextSpan(
                                text: name,
                                style: GoogleFonts.getFont(fontNameGlobal)),
                            TextSpan(
                              text: suffix,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            toolbarHeight: 260,
            title: Container(
                margin: EdgeInsets.only(bottom: 172),
                child: Text(
                  "Custom Name Generator",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            actions: [
              Container(
                margin: EdgeInsets.only(bottom: 172),
                child: IconButton(
                  onPressed: () {
                    print(answer);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomNamePreview(
                                  answer: answer,
                                  fontName: fontNameGlobal,
                                  prefix: prefix,
                                  suffix: suffix,
                                  word: name,
                                )));
                  },
                  icon: Image.asset(
                    'assets/images/next.png',
                    height: 24,
                    width: 24,
                  ),
                ),
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: backgroundUI,
                    borderRadius: BorderRadius.circular(10)),
                child: TabBar(
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.black,
                  indicator: MyTabIndicator(overlayColor: Colors.white),
                  padding: EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  tabs: [
                    Tab(
                      child: Text("Prefix"),
                    ),
                    Tab(
                      child: Text("Font Style"),
                    ),
                    Tab(
                      child: Text("Suffix"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    children: [
                      prefixListView(),
                      fontStyleListView(),
                      suffixListView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView suffixListView() {
    return ListView.builder(
      itemCount: mySuffixList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            suffix = mySuffixList[index];
            print("$index + ${mySuffixList[index]}");

            setState(() {});
          },
          child: ListTile(
            title: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: backgroundUI,
                ),
                padding: EdgeInsets.all(16),
                child: Center(child: Text(mySuffixList[index]))),
          ),
        );
      },
    );
  }

  ListView fontStyleListView() {
    return ListView.builder(
      itemCount: stylishFonts.length,
      itemBuilder: (context, int index) {
        var fontName = stylishFonts[index];
        final sampleText = widget.nameController;
        var textStyle = GoogleFonts.getFont(
          fontName,
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            // Add any additional styles you desire
          ),
        );

        return GestureDetector(
          onTap: () {
            fontNameGlobal = fontName;
            setState(() {});
          },
          child: ListTile(
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backgroundUI,
              ),
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  sampleText,
                  style: textStyle,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  ListView prefixListView() {
    return ListView.builder(
      itemCount: myPrefixList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            prefix = myPrefixList[index];
            print("$index + ${myPrefixList[index]}");

            setState(() {});
          },
          child: ListTile(
            title: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: backgroundUI,
                ),
                padding: EdgeInsets.all(16),
                child: Center(child: Text(myPrefixList[index]))),
          ),
        );
      },
    );
  }
}

class MyTabIndicator extends Decoration {
  final Color overlayColor;

  const MyTabIndicator({required this.overlayColor});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MyTabIndicatorPainter(overlayColor: overlayColor);
  }
}

class _MyTabIndicatorPainter extends BoxPainter {
  final Color overlayColor;

  _MyTabIndicatorPainter({required this.overlayColor});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(10)),
      paint,
    );
  }
}
