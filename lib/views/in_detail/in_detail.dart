import 'package:flutter/material.dart';

import '../custom name screens/custom_name_generator.dart';
import '../custom name screens/custom_name_preview.dart';
import '../random name screens/random_name_generator.dart';

class InDetail extends StatefulWidget {
  const InDetail({super.key});

  @override
  State<InDetail> createState() => _InDetailState();
}

class _InDetailState extends State<InDetail> {

  var answer = "";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: false,

          toolbarHeight: 200,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CustomNameGenerator(
                                          nameController: answer)));
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RandomNameGenerator(
                                        nameController: answer,
                                      )));
                            },
                            icon: Icon(Icons.newspaper)),
                      ],
                    )
                  ],
                ),
              ),
              TabBar(
                isScrollable: true,
                tabs: [
                  buildTab("STYLISH NICKNAMES"),
                  buildTab("ALL SYMBOLS"),
                  buildTab("ALL STYLISH LETTERS"),
                  buildTab("MILITARY NAME IDEA"),
                  buildTab("SAVED"),
                ],
              ),
            ],
          ),
          // title: const Text("Name Ideas"),
        ),

      ),
    );
  }
  Tab buildTab(String title) {
    return Tab(
      child: Text(title),
    );
  }
}
