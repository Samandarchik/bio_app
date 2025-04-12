import 'package:bio_app/color.dart';
import 'package:bio_app/core/constants/urls.dart';
import 'package:bio_app/core/di/di.dart';
import 'package:bio_app/widget/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MaruzaPage extends StatefulWidget {
  final ThemeModel mavzu;
  const MaruzaPage({super.key,required th});

  @override
  State<MaruzaPage> createState() => _MaruzaPageState();
}

class _MaruzaPageState extends State<MaruzaPage> {
  ThemeService themeService = ThemeService();
  List<Theme> mavzuList = [];
  @override
  void initState() {
    super.initState();
    themeService.getMavzuList().then((value) {
      setState(() {
        mavzuList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  itemBuilder: (context, index) => ThemeCard(mavzu: mavzuList[index]()),
            ),
          ],
        ),
      ),
    ));
  }
}

class ThemeService {
  final Dio dio = sl<Dio>();
  Future<List<Theme>> getMavzuList() async {
    final response = await dio.get(AppUrls.themeList);

    if (response.statusCode == 200) {
      final data = response.data['data'];
      return data.map<Theme>((json) => ThemeModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch mavzu list');
    }
  }
}

class ThemeModel {
  final int id;
  final String? title;
  final String? comment;
  final String? content;
  final String? file;
  final String? audio;
  final String? prezintatsiya;
  final String? iframe;
  final int? testNum;
  final String? subject;

  ThemeModel({
    required this.id,
    this.title,
    this.comment,
    this.content,
    this.file,
    this.audio,
    this.prezintatsiya,
    this.iframe,
    this.testNum,
    this.subject,
  });
  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      id: json['id'],
      title: json['title'],
      comment: json['comment'],
      content: json['content'],
      file: json['file'],
      audio: json['audio'],
      prezintatsiya: json['prezintatsiya'],
      iframe: json['iframe'],
      testNum: json['test_num'],
      subject: json['subject'],
    );
  }
}


// [
//     {
//         "id": 1,
//         "themeModel": {
//             "id": 1,
//             "title": "1",
//             "comment": "1",
//             "content": "<p>1&nbsp;&nbsp;&nbsp;&nbsp;</p>",
//             "file": "/media/theme/files/Zoom.exe",
//             "audio": null,
//             "prezintatsiya": null,
//             "iframe": "1",
//             "test_num": 25,
//             "subject": "1661d916-ebc3-4eb4-b4c5-002c7f59385b"
//         },
//         "results": [],
//         "title": "Title",
//         "content": "<p>Content&nbsp;</p>"
//     }
// ]