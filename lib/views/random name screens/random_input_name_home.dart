import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:nick_name/views/random%20name%20screens/random_name_generator.dart';

import '../../utils/constant.dart';

class RandomInputName extends StatefulWidget {
  const RandomInputName({super.key});

  @override
  State<RandomInputName> createState() => _RandomInputNameState();
}

class _RandomInputNameState extends State<RandomInputName> {
  TextEditingController nameController = TextEditingController();

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
            "Name Input",
            style: kAppbarStyle,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 16, left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: circleAvatarUI,
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
                    child: TextField(
                      style: TextStyle(fontSize: 25,fontFamily: "Montserrat"),
                      maxLines: null,
                      textAlign: TextAlign.center,
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: "Enter Name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Container(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(5),
                    //
                    // ),
                    height: 60,
                    width: double.infinity,

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // backgroundColor: Color(0xff3A8FCC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Adjust the radius as needed
                          ),
                        ),
                        onPressed: () {
                          if (nameController.text.trim().isNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RandomNameGenerator(
                                      nameController: nameController.text,
                                    )));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Name cannot be empty"),
                              duration: Duration(seconds: 1),
                            ));
                          }
                        },
                        child: const Text(
                          "Generate",
                          style: TextStyle(fontSize: 18,fontFamily: "Montserrat"),
                        )),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
