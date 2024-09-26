// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class AboutModel extends StatefulWidget {
  const AboutModel({super.key});

  @override
  State<AboutModel> createState() => _AboutModelState();
}

class _AboutModelState extends State<AboutModel> {
  final List<Widget> carouselItems = [
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.green,
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromARGB(255, 87, 21, 167),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromARGB(255, 223, 125, 55),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.green,
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromARGB(255, 87, 21, 167),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromARGB(255, 223, 125, 55),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width <= 700;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("About Model",
              style: TextStyle(
                  fontSize: isMobile? 30: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: screenHeight*0.03,
          ),
          ExpandableCarousel(
            options: ExpandableCarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
            ),
            items: [
              "assets/images/1.png",
              "assets/images/2.png",
              "assets/images/3.png",
              "assets/images/4.png",
              "assets/images/5.png",
              "assets/images/6.png",
              "assets/images/7.png",
              "assets/images/8.png",
              "assets/images/9.png",
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    height: isMobile? screenHeight*0.4 : screenHeight*0.6,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.white),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          i,
                          fit: isMobile? BoxFit.fitWidth : BoxFit.fitHeight,
                        )),
                  );
                },
              );
            }).toList(),
          )
          // SafeArea(
          //     child: Container(
          //         padding: EdgeInsets.all(70),
          //         height: MediaQuery.of(context).size.height,
          //         width: double.infinity,
          //         child: ))
        ],
      ),
    );
  }
}
