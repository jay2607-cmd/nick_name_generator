import 'package:flutter/material.dart';
import 'package:nick_name/views/random%20name%20screens/random_name_generator.dart';

class RandomInputNameHome extends StatefulWidget {
  const RandomInputNameHome({super.key});

  @override
  State<RandomInputNameHome> createState() => _RandomInputNameHomeState();
}

class _RandomInputNameHomeState extends State<RandomInputNameHome> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auto Name Generator"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Enter Name"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                if (nameController.text.trim().isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RandomNameGenerator(
                            nameController: nameController.text,
                          )));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Name cannot be empty"),
                    duration: Duration(seconds: 1),
                  ));
                }
              },
              child: const Text("Generate"))
        ],

      ),
    );
  }
}
