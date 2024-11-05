import 'package:bio_app/color.dart';

import 'package:bio_app/screen/quiz_screen.dart';
import 'package:flutter/material.dart';

class MavzuPage extends StatelessWidget {
  MavzuPage({super.key});

  @override
  final List<IconData> icons = [
    Icons.document_scanner_outlined,
    Icons.play_arrow,
    Icons.video_library,
    Icons.videocam,
    Icons.desktop_windows_outlined,
  ];
  final List<String> items = ["Matn", "Audio", "Slayd", "Video", "Multimediya"];
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ktransparent,
        title: Text(
          "1-Mavzu",
          style: TextStyle(
              color: kblack, fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),
      body: Container(
        decoration: kBoxDecoration,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Card(
                        margin:
                            EdgeInsets.all(16.0), // Karta atrofiga joy berish
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12), // Karta burchaklarini yumaloq qilish
                        ),
                        elevation: 4, // Karta soyasi
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.9, // Ekranning 90% qismi kengligida bo'ladi
                          padding: EdgeInsets.all(
                              16.0), // Karta ichidagi elementlar uchun joy
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
                                  SizedBox(height: 10),
                                  Text('Card description goes here.'),
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
            Divider(),
            Container(
                padding: EdgeInsets.only(bottom: size.height * .035),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizScreen()));
                    },
                    child: Text("Qayta topshiri")))
          ],
        ),
      ),
    );
  }
}
