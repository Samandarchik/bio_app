import 'package:bio_app/color.dart';
import 'package:bio_app/screen/mavzu_page.dart';
import 'package:flutter/material.dart';

class MaruzaPage extends StatelessWidget {
  const MaruzaPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double media = size.height;
    return Scaffold(
        body: Container(
      decoration: kBoxDecoration,
      child: SafeArea(
        child: Column(
          children: [
            Text(
              "Mavzularim",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: kblack, fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MavzuPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 220,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/image.png",
                                  ),
                                  fit: BoxFit.cover),
                            ),
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
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 10),
                                  child: Text(
                                    "${index + 1}-Mavzu",
                                    style: TextStyle(
                                        fontSize: 35, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
            ),
          ],
        ),
      ),
    ));
  }
}
