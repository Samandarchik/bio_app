import 'package:flutter/material.dart';

extension CustomContext on BuildContext {
  // Screen size helpers
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  void push(Widget page) =>
      Navigator.push(this, MaterialPageRoute(builder: (context) => page));
  void pushReplace(Widget page) => Navigator.pushReplacement(
      this, MaterialPageRoute(builder: (context) => page));
  void pushAndRemoveUntil(Widget page) => Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false);
}
