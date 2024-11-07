import 'package:bio_app/color.dart';
import 'package:bio_app/widget/mycar.dart';
import 'package:bio_app/screen/mavzu_screen.dart';
import 'package:flutter/material.dart';

class MaruzaPage extends StatelessWidget {
  const MaruzaPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> mavzuList = [
      {
        "Images": "assets/images/image.png",
        "Item": 1,
        "Topic": "BIRINCHI MAVZU HAQIDA"
      },
      {
        "Images": "assets/images/image1.png",
        "Item": 2,
        "Topic": "BIRINCHI MAVZU HAQIDA"
      },
      {
        "Images": "assets/images/image2.png",
        "Item": 3,
        "Topic": "BIRINCHI MAVZU HAQIDA"
      },
      {
        "Images": "assets/images/image3.png",
        "Item": 4,
        "Topic": "BIRINCHI MAVZU HAQIDA"
      }
    ];
    return Scaffold(
        body: Container(
      decoration: kBoxDecoration,
      child: SafeArea(
        child: Column(
          children: [
            Text(
              "Mavzularim",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: kwhite, fontSize: 24),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: mavzuList.length,
                  itemBuilder: (context, index) => MyCard(
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MavzuPage(
                                      mavzuList: mavzuList, index: index)));
                        },
                        index: "",
                        images: "${mavzuList[index]["Images"]}".toString(),
                        text: "${(index + 1)}-Mavzu",
                      )),
            ),
          ],
        ),
      ),
    ));
  }
}
