import 'package:bio_app/data/color.dart';
import 'package:bio_app/core/di/di.dart';
import 'package:bio_app/data/text_style.dart';
import 'package:bio_app/models/theme_model.dart';
import 'package:bio_app/pages/mavzu/mavzu_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaruzaPage extends StatefulWidget {
  const MaruzaPage({
    super.key,
  });

  @override
  State<MaruzaPage> createState() => _MaruzaPageState();
}

class _MaruzaPageState extends State<MaruzaPage> {
  ThemeService themeService = ThemeService();
  List<ThemeModel> mavzuList = [];
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
              style: TS.tsBCW(24.sp),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: mavzuList.length,
                  itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: ListTile(
                          title: Text(mavzuList[index].title),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MavzuPage(
                                mavzu: mavzuList[index],
                              ),
                            ),
                          ),
                        ),
                      )),
            )
          ],
        ),
      ),
    ));
  }
}

class ThemeService {
  final Dio dio = sl<Dio>();
  Future<List<ThemeModel>> getMavzuList() async {
    final response = await dio.get("https://zoomedia.uz/api/themes/");

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map<ThemeModel>((json) => ThemeModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch mavzu list');
    }
  }
}
