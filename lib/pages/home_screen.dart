import 'package:bio_app/data/color.dart';
import 'package:bio_app/widgets/image_card.dart';
import 'package:bio_app/pages/maruza_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBoxDecoration,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              children: [
                const Text(
                  "Media Zoologiya",
                  style: TextStyle(
                    color: kwhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                Expanded(
                    child: MyCard(
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MaruzaPage()));
                        },
                        images: "assets/images/maruza.jpg",
                        index: "",
                        text: "Maruza")),
                Expanded(
                    child: MyCard(
                        press: () {},
                        images: "assets/images/amayliy.jpg",
                        index: "",
                        text: "Amaliy Mashgʻulot ")),
                Expanded(
                    child: MyCard(
                        press: () {},
                        images:
                            "assets/images/Screenshot 2024-11-05 at 20.14.15.png",
                        index: "",
                        text: "Mustaqil ish")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String images;
  final VoidCallback press;
  final String text;
  const Category(
      {super.key,
      required this.images,
      required this.text,
      required this.press});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: GestureDetector(
        onTap: press,
        child: Container(
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  images,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: size.height * .22,
                ),
              ),
              Text(
                text,
              )
            ],
          ),
        ),
      ),
    );
  }
}
