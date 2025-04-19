import 'package:bio_app/core/context_extension.dart';
import 'package:bio_app/data/color.dart';
import 'package:bio_app/data/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCategory extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget page;
  const MyCategory(
      {super.key, required this.title, required this.icon, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: const BoxDecoration(color: kwhite),
      child: ListTile(
        title: Text(
          title,
          style: TS.tsB(16.sp),
        ),
        trailing: Icon(
          icon,
          size: 30.sp,
        ),
        onTap: () => context.push(page),
      ),
    );
  }
}
