import 'package:bio_app/color.dart';

import 'package:bio_app/screen/quiz_screen.dart';
import 'package:flutter/material.dart';

class MavzuPage extends StatelessWidget {
  final List mavzuList;
  final int index;
  MavzuPage({super.key, required this.index, required this.mavzuList});

  final List<IconData> icons = [
    Icons.document_scanner_outlined,
    Icons.play_arrow,
    Icons.video_library,
    Icons.videocam,
    Icons.desktop_windows_outlined,
  ];
  final List<String> items = ["Matn", "Audio", "Slayd", "Video", "Multimediya"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBoxDecoration,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  mavzuList[index]["Topic"],
                  style: textstyle.copyWith(overflow: TextOverflow.ellipsis),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) => Card(
                          color: kCardColor,
                          margin: EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Karta burchaklarini yumaloq qilish
                          ),
                          elevation: 4, // Karta soyasi
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: EdgeInsets.symmetric(
                                vertical: 30, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(items[index],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Icon(
                                  icons[index],
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                        )),
              ),
              Divider(
                color: kwhite,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuizScreen()));
                  },
                  child: Text(
                    "Test topshirish",
                    style: textstyle.copyWith(fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
