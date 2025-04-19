import 'package:bio_app/models/theme_model.dart';
import 'package:flutter/material.dart';

class ThemeCard extends StatelessWidget {
  final ThemeModel themeModel;
  const ThemeCard({super.key, required this.themeModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 220,
          width: double.infinity,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(20),
          //   image: DecorationImage(
          //       image: AssetImage(
          //         images,
          //       ),
          //       fit: BoxFit.cover),
          // ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(.7),
                    Colors.black,
                  ]),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                  "indextext",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
