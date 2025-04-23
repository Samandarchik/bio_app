import 'package:bio_app/data/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';

class TextPage extends StatelessWidget {
  final String text;
  const TextPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: kBoxDecoration,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: kwhite,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      "Text",
                      style: TextStyle(
                        color: kwhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(width: 50.w),
                  ],
                ),
                HtmlContentViewer(
                  htmlContent: text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
