import 'package:bio_app/color.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> variant = [
      "A: Physical device",
      "B:Building UI",
      "C:Navigation Feature",
      "D:DBMS"
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ktransparent,
        actions: [TextButton(onPressed: () {}, child: Text("Skip"))],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: kBoxDecoration,
        child: Column(
          children: [
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: kwhite, borderRadius: BorderRadius.circular(30)),
              height: size.height * .6,
              width: size.width * .9,
              child: Column(
                children: [
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "What is Flutter Widget?",
                    style: TextStyle(
                        color: kblack,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) => Container(
                              height: size.height * .09,
                              margin: EdgeInsets.all(10),
                              width: size.width * .6,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      variant[index],
                                    ),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.grey)),
                                    )
                                  ],
                                ),
                              ),
                            )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
