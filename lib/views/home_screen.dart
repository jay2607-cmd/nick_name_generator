import 'package:flutter/material.dart';
import 'package:nick_name/views/custom%20name%20screens/custom_input_name_home.dart';
import 'package:nick_name/views/bookmarkes_name.dart';
import 'package:nick_name/views/in_detail/in_detail.dart';
import 'package:nick_name/views/name%20ideas/name_ideas.dart';
import 'package:nick_name/views/random%20name%20screens/random_input_name_home.dart';
import 'package:nick_name/views/trending_names_home_screen.dart';

import '../constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(
            height: 435,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffF0F1F5),width: 2.5),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/1.png",
                        height: 80,
                        width: 80,
                        fit: BoxFit.contain,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nick Name : ",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Fancy Name Generator",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 13, bottom: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: circleAvatarUI,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Image.asset("assets/images/info.png",
                                  height: 35, width: 30, fit: BoxFit.contain),
                              SizedBox(
                                height: 7,
                              ),
                              Image.asset("assets/images/ads.png",
                                  height: 35, width: 30, fit: BoxFit.contain),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  // color: Color(0xFFDCDFE3),
                  color: Color(0xffF0F1F5),
                  thickness: 2,
                  indent: Checkbox.width,
                  endIndent: Checkbox.width,
                ),
                GridView.count(
                  childAspectRatio: 4.68 / 3,
                  shrinkWrap: true,
                  primary: false,
                  // padding: const EdgeInsets.only(
                  //     left: 18, top: 7.5, bottom: 15, right: 18),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 4,
                  crossAxisCount: 2,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomInputNameHome()));
                        },
                        child: Image.asset("assets/images/btn1.png")),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RandomInputName()));
                        },
                        child: Image.asset("assets/images/btn2.png")),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TrendingNamesHomeScreen()));
                        },
                        child: Image.asset("assets/images/btn3.png")),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NameIdeas()));
                        },
                        child: Image.asset("assets/images/btn4.png")),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InDetail()));
                        },
                        child: Image.asset("assets/images/btn5.png")),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookmarkedNames()));
                        },
                        child: Image.asset("assets/images/btn6.png")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
