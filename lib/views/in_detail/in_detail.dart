import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';

import '../../utils/constant.dart';
import '../../database/bookmark.dart';
import '../../utils/symbols_list.dart';
import '../custom name screens/custom_name_generator.dart';
import '../random name screens/random_name_generator.dart';

class InDetail extends StatefulWidget {
  const InDetail({Key? key}) : super(key: key);

  @override
  State<InDetail> createState() => _InDetailState();
}

Box<Bookmark> bookmarkBox = Hive.box<Bookmark>('bookmark');

class _InDetailState extends State<InDetail> {
  List<Bookmark> bookmarkedNames = bookmarkBox.values.toList();

  final FocusNode _textFieldFocusNode = FocusNode();

  var answer = "Demo Text";
  var nameForStyle = "Name";

  String fontNameGlobal = "Montserrat";

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller2.text = nameForStyle;
    _textFieldFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                margin: EdgeInsets.only(bottom: 235),
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
            title: Container(
                margin: EdgeInsets.only(bottom: 235),
                child: Text("In Details", style: kAppbarStyle)),
            toolbarHeight: 285,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 135,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backgroundUI,
                            ),
                            width: double.infinity,
                            child: Center(
                              child: TextField(
                                maxLines: null,
                                decoration: const InputDecoration(
                                  hintText: "Enter Name",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat', // Replace with the desired font family for hint text
                                  ),
                                  border: InputBorder.none,
                                ),
                                textAlign: TextAlign.center,
                                controller: controller1,
                                style: TextStyle(fontFamily: fontNameGlobal),
                                focusNode: _textFieldFocusNode,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: circleAvatarUI,
                              child: Container(
                                height: 45,
                                width: 45,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomNameGenerator(
                                                      nameController:
                                                          controller1.text)));
                                    },
                                    icon: Image.asset(
                                      'assets/images/edit.png',
                                    )),
                              ),
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: circleAvatarUI,
                              child: Container(
                                height: 45,
                                width: 45,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RandomNameGenerator(
                                                    nameController:
                                                        controller1.text,
                                                  )));
                                    },
                                    icon: Image.asset(
                                      'assets/images/auto.png',
                                    )),
                              ),
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: circleAvatarUI,
                              child: Container(
                                height: 45,
                                width: 45,
                                child: IconButton(
                                  onPressed: () {
                                    controller1.clear();
                                  },
                                  icon: Image.asset(
                                    'assets/images/close.png',
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: circleAvatarUI,
                              child: Container(
                                height: 45,
                                width: 45,
                                child: IconButton(
                                  onPressed: () {
                                    Clipboard.setData(new ClipboardData(
                                            text: "${controller1.text}"))
                                        .then((_) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Copied to your clipboard !')));
                                    });
                                  },
                                  icon: Image.asset(
                                    'assets/images/copy.png',
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: circleAvatarUI,
                              child: Container(
                                height: 45,
                                width: 45,
                                child: IconButton(
                                  onPressed: () {
                                    if (controller1.text.isNotEmpty) {
                                      Share.share('${controller1.text}',
                                          subject: 'Sharing from Nick Name');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(buildSnackBar(
                                              "Empty Value Cannot be Shared"));
                                    }
                                  },
                                  icon: Image.asset(
                                    'assets/images/share.png',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 16),
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
                    isScrollable: true,
                    tabs: [
                      buildTab("STYLISH NICKNAMES"),
                      buildTab("ALL SYMBOLS"),
                      buildTab("ALL STYLISH LETTERS"),
                      buildTab("SAVED"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildListViewForStylishNickNames(fontNameList),
              buildListViewForAllSymbols(prefixList, suffixList),
              buildListViewForAllStylishLetters(),
              bookmarkedNames.isEmpty
                  ? Center(child: Text("No Saved Names"))
                  : Container(
                      color: Colors.white,
                      child: Container(
                        margin: EdgeInsets.only(top: 8),
                        child: ListView.builder(
                          itemCount: bookmarkBox.length,
                          itemBuilder: (BuildContext context, int index) {
                            String savedNames = bookmarkedNames[index].name;
                            String fontName = bookmarkedNames[index].fontName;
                            String prefix = bookmarkedNames[index].prefix;
                            String suffix = bookmarkedNames[index].suffix;
                            String word = bookmarkedNames[index].word;
                            bool isAIGenerated =
                                bookmarkedNames[index].isAIGenerated;

                            bool isBookmarked = bookmarkBox.values
                                .any((bookmark) => bookmark.name == savedNames);

                            return GestureDetector(
                              onTap: () {
                                String selectedText = savedNames;
                                _insertTextAtCursor(selectedText);
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
                                    savedNames,
                                    style: !isAIGenerated
                                        ? TextStyle(
                                            fontFamily: fontName,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )
                                        : null,
                                  )),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  SnackBar buildSnackBar(String content) {
    return SnackBar(
      content: Text(content),
      backgroundColor: Colors.red.shade300,
      duration: Duration(seconds: 1),
    );
  }

  Tab buildTab(String title) {
    return Tab(
      child: Text(
        title,
        style: kNoneStyle,
      ),
    );
  }

  buildListViewForStylishNickNames(List<String> name) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    style: kNoneStyle,
                    textAlign: TextAlign.center,
                    controller: controller2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  onPressed: () {
                    nameForStyle = controller2.text;
                    setState(() {});
                  },
                  icon: Icon(Icons.done),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: name.length,
              itemBuilder: (BuildContext context, int index) {
                var fontName = name[index];
                return GestureDetector(
                  onTap: () {
                    String selectedText = controller2.text;
                    _insertTextAtCursor(selectedText);
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
                          controller2.text,
                          style: TextStyle(fontFamily: fontName),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  buildListViewForAllSymbols(List<String> name1, List<String> name2) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 36,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: backgroundUI, borderRadius: BorderRadius.circular(10)),
              child: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.black,
                indicator: MyTabIndicator(overlayColor: Colors.white),
                padding: EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                tabs: [
                  Tab(
                    child: Text(
                      "Prefix",
                      style: kNoneStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Suffix",
                      style: kNoneStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: TabBarView(
            children: [
              ListView.builder(
                itemCount: name1.length,
                itemBuilder: (BuildContext context, int index) {
                  var prefixName = name1[index];
                  return GestureDetector(
                    onTap: () {
                      String selectedText = prefixName;
                      _insertTextAtCursor(selectedText);
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
                            prefixName,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: name2.length,
                itemBuilder: (BuildContext context, int index) {
                  var suffixName = name2[index];
                  return GestureDetector(
                    onTap: () {
                      String selectedText = suffixName;
                      _insertTextAtCursor(selectedText);
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
                            suffixName,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  buildListViewForAllStylishLetters() {
    return DefaultTabController(
      length: 26,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 36,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: backgroundUI, borderRadius: BorderRadius.circular(10)),
              child: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.black,
                indicator: MyTabIndicator(overlayColor: Colors.white),
                padding: EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                isScrollable: true,
                tabs: [
                  for (int i = 0; i < 26; i++)
                    buildTab(String.fromCharCode('A'.codeUnitAt(0) + i)),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            buildListViewForStylishLetters(letterA),
            buildListViewForStylishLetters(letterB),
            buildListViewForStylishLetters(letterC),
            buildListViewForStylishLetters(letterD),
            buildListViewForStylishLetters(letterE),
            buildListViewForStylishLetters(letterF),
            buildListViewForStylishLetters(letterG),
            buildListViewForStylishLetters(letterH),
            buildListViewForStylishLetters(letterI),
            buildListViewForStylishLetters(letterJ),
            buildListViewForStylishLetters(letterK),
            buildListViewForStylishLetters(letterL),
            buildListViewForStylishLetters(letterM),
            buildListViewForStylishLetters(letterN),
            buildListViewForStylishLetters(letterO),
            buildListViewForStylishLetters(letterP),
            buildListViewForStylishLetters(letterQ),
            buildListViewForStylishLetters(letterR),
            buildListViewForStylishLetters(letterS),
            buildListViewForStylishLetters(letterT),
            buildListViewForStylishLetters(letterU),
            buildListViewForStylishLetters(letterV),
            buildListViewForStylishLetters(letterW),
            buildListViewForStylishLetters(letterX),
            buildListViewForStylishLetters(letterY),
            buildListViewForStylishLetters(letterZ),
          ],
        ),
      ),
    );
  }

  buildListViewForStylishLetters(List<String> name1) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: name1.length,
        itemBuilder: (BuildContext context, int index) {
          var prefixName = name1[index];
          return GestureDetector(
            onTap: () {
              String selectedText = prefixName;
              _insertTextAtCursor(selectedText);
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
                    prefixName,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _insertTextAtCursor(String text) {
    final currentText = controller1.text;
    final selection = controller1.selection;

    final newText =
        currentText.replaceRange(selection.start, selection.end, text);
    final newSelection =
        TextSelection.collapsed(offset: selection.start + text.length);

    controller1.value = TextEditingValue(
      text: newText,
      selection: newSelection,
    );
  }
}
