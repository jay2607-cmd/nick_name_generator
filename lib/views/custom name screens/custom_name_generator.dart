import 'package:flutter/material.dart';
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
  final List<String> symbolsList = symbolsListVariable;
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
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Name Generator"),
          actions: [
            IconButton(
                onPressed: () {
                  print(answer);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomNamePreview(
                                answer: answer, fontName: fontNameGlobal,
                            prefix: prefix,
                            suffix: suffix,
                            word: name,
                              )));
                },
                icon: Icon(Icons.navigate_next))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 70,
                color: Colors.grey.shade300,
                child: Center(
                  child: RichText(

                    text: TextSpan(
                      style: TextStyle(fontSize: 20,color: Colors.black ),
                      children: [
                        TextSpan(
                          text: prefix,
                        ),
                        TextSpan(
                          text: name,
                          style: GoogleFonts.getFont(fontNameGlobal)
                        ),
                        TextSpan(
                          text: suffix,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: symbolsList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          prefix = symbolsList[index];
                          print(symbolsList[index] + widget.nameController);

                          setState(() {});
                        },
                        child: ListTile(
                          title: Text(symbolsList[index]),
                        ),
                      );
                    },
                  ),

                  ListView.builder(
                    itemCount: stylishFonts.length,
                    itemBuilder: (context,int index) {
                      var fontName = stylishFonts[index];
                      final sampleText = widget.nameController;
                      var textStyle = GoogleFonts.getFont(
                        fontName,
                        textStyle: const TextStyle(
                          fontSize: 24,
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
                          title: Text(
                            sampleText,
                            style: textStyle,
                          ),
                        ),
                      );
                    },
                  ),

                  ListView.builder(
                    itemCount: symbolsList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          suffix = symbolsList[index];
                          print(widget.nameController + symbolsList[index]);

                          setState(() {});
                        },
                        child: ListTile(
                          title: Text(symbolsList[index]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const Material(
          child: TabBar(
            tabs: [
              Tab(
                child: Text("Prefix"),
              ),
              Tab(
                child: Text("Name"),
              ),
              Tab(
                child: Text("Suffix"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
