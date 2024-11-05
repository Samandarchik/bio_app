import 'package:bio_app/color.dart';
import 'package:bio_app/screen/maruza_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: kBoxDecoration,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  "data",
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
                Category(
                  images: "assets/images/image3.png",
                  text: "Maruza",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MaruzaPage()));
                  },
                ),
                Category(
                  images: "assets/images/image1.png",
                  text: "Labalatoria",
                  press: () {},
                ),
                Category(
                  images: "assets/images/image2.png",
                  text: "Maruza",
                  press: () {},
                ),
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
  VoidCallback press;
  final String text;
  Category(
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
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4, // Karta soyasi
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  child: Image.asset(
                    images,
                    height: size.height * .2,
                    width: size.width * .9,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(' Card Title',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('  Card description goes here.'),
              ],
            ),
          )),
    );
  }
}
