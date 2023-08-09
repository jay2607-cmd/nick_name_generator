import 'package:flutter/material.dart';
import 'package:nick_name/views/trending_names_category/cod.dart';
import 'package:nick_name/views/trending_names_category/free_fire.dart';
import 'package:nick_name/views/trending_names_category/pubg.dart';
import 'package:nick_name/views/trending_names_category/valorent.dart';

import '../constant.dart';

class TrendingNamesHomeScreen extends StatefulWidget {
  const TrendingNamesHomeScreen({super.key});

  @override
  State<TrendingNamesHomeScreen> createState() =>
      _TrendingNamesHomeScreenState();
}

class _TrendingNamesHomeScreenState extends State<TrendingNamesHomeScreen> {
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
            "Select Category",
            style: kAppbarStyle,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          height: 225,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffF0F1F5), width: 2.5),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            children: [
              GridView.count(
                childAspectRatio: 4.68 / 3,
                shrinkWrap: true,
                primary: false,
                // padding: const EdgeInsets.only(
                //     left: 18, top: 7.5, bottom: 15, right: 18),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                crossAxisSpacing: 17,
                mainAxisSpacing: 4,
                crossAxisCount: 2,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Pubg()));
                      },
                      child: Image.asset("assets/images/btn7.png")),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FreeFire()));
                      },
                      child: Image.asset("assets/images/btn8.png")),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Cod()));
                      },
                      child: Image.asset("assets/images/btn9.png")),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Valorent()));
                      },
                      child: Image.asset("assets/images/btn10.png")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
