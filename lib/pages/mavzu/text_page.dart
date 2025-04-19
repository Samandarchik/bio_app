import 'package:bio_app/data/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';

class TextPage extends StatelessWidget {
  final String text;
  const TextPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBoxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: HtmlContentViewer(
              htmlContent: text,
              initialContentHeight: MediaQuery.of(context).size.height,
              initialContentWidth: MediaQuery.of(context).size.width,
            ))
          ],
        ),
      ),
    );
  }
}
