import 'package:flutter/material.dart';
import 'package:nick_name/symbolsList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> symbolsList = symbolsListVariable;

  @override
  void initState() {
    super.initState();
    for (int i = 0 ; i < symbolsList.length ; i++) {
      print(symbolsList[i]);
    }
    print(symbolsList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Name Generator"),),
      body: ListView.builder(
        itemCount: symbolsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(symbolsList[index]),
          );
        },
      ),
    );
  }
}
