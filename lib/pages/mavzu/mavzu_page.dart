import 'package:bio_app/data/color.dart';
import 'package:bio_app/data/text_style.dart';
import 'package:bio_app/models/theme_model.dart';
import 'package:bio_app/pages/mavzu/audio_page.dart';
import 'package:bio_app/pages/mavzu/slayd_page.dart';
import 'package:bio_app/pages/mavzu/vidio_page.dart';
import 'package:bio_app/pages/quiz_screen.dart';
import 'package:bio_app/pages/mavzu/text_page.dart';
import 'package:bio_app/widgets/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MavzuPage extends StatelessWidget {
  final ThemeModel mavzu;
  MavzuPage({super.key, required this.mavzu});

  final List<IconData> icons = [
    Icons.document_scanner_outlined,
    Icons.play_arrow,
    Icons.video_library,
    Icons.videocam,
  ];
  final List<String> items = ["Matn", "Audio", "Slayd", "Video"];
  List<Widget> get pages => [
        TextPage(text: mavzu.content),
        AudioPage(audioUrl: mavzu.audio ?? ""),
        SlaydPage(slaydUrl: mavzu.prezintatsiya ?? ""),
        VideoPage(vidioUrl: mavzu.iframe ?? ""),
      ];

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
                  mavzu.title,
                  style: textstyle.copyWith(overflow: TextOverflow.ellipsis),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) => MyCategory(
                          title: items[index],
                          icon: icons[index],
                          page: pages[index],
                        )),
              ),
              const Divider(
                color: kwhite,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuizScreen()));
                  },
                  child: Text(
                    "Test topshirish",
                    style: TS.tsBCW(20.sp),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
