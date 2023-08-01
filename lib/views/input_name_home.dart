import 'package:flutter/material.dart';
import 'package:nick_name/home_screen.dart';

class InputNameHome extends StatefulWidget {
  const InputNameHome({super.key});

  @override
  State<InputNameHome> createState() => _InputNameHomeState();
}

class _InputNameHomeState extends State<InputNameHome> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NameStyle"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(hintText: "Enter Name"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                if (nameController.text.trim().isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                nameController: nameController.text,
                              )));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Name cannot be empty"), duration: Duration(seconds: 1),));
                }
              },
              child: const Text("Generate"))
        ],
      ),
    );
  }
}
