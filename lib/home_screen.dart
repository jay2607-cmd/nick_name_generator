import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nick_name/symbols_list.dart';
import 'package:nick_name/views/name_preview.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  String nameController = "";
  HomeScreen({super.key, required this.nameController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> symbolsList = symbolsListVariable;
  String prefix = "";
  String suffix = "";

  var textStyle;

  final List<String> stylishFonts = [
    'Pacifico',
    'Dancing Script',
    'Lobster',
    'Montserrat Alternates',
    'Raleway Dots',
    'Bungee Shade',
    'Righteous',
    'Kaushan Script',
    'Trade Winds',
    'Monoton',
    'Black Ops One',
    'Exo 2',
    'Luckiest Guy',
    'Press Start 2P',
    'Orbitron',
    'Poppins',
    'Kanit',
    'Anton',
    'Varela Round',
    'Comfortaa',
  ];

  String name = "";
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < symbolsList.length; i++) {
      if (kDebugMode) {
        print(symbolsList[i]);
      }
    }

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
                          builder: (context) => NamePreview(
                                answer: answer, textStyle: textStyle,
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
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                      children: [
                        TextSpan(
                          text: prefix,
                        ),
                        TextSpan(text: ' '),
                        TextSpan(
                          text: name,
                          style: textStyle,
                        ),
                        TextSpan(text: ' '),
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

                  /*ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(symbolsList[index]),
                      );
                    },
                  ),*/

                  ListView.builder(
                    itemCount: stylishFonts.length,
                    itemBuilder: (context, index) {
                      final fontName = stylishFonts[index];
                      final sampleText = '${widget.nameController}';
                      textStyle = GoogleFonts.getFont(
                        fontName,
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          // Add any additional styles you desire
                        ),
                      );

                      return GestureDetector(
                        onTap: () {
                          final fontName = stylishFonts[index];
                          textStyle = GoogleFonts.getFont(fontName,
                              textStyle: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                // Add any additional styles you desire
                              ));
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
