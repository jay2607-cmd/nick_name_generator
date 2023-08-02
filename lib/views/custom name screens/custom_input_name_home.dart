import 'package:flutter/material.dart';

import 'custom_name_generator.dart';

class CustomInputNameHome extends StatefulWidget {
  const CustomInputNameHome({super.key});

  @override
  State<CustomInputNameHome> createState() => _CustomInputNameHomeState();
}

class _CustomInputNameHomeState extends State<CustomInputNameHome> {
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
                          builder: (context) => CustomNameGenerator(
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
