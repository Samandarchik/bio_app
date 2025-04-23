import 'package:bio_app/data/color.dart';
import 'package:flutter/material.dart';

class TestList extends StatelessWidget {
  const TestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("1-Mavzu"),
      ),
      body: Column(
        children: [
          ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: kblack,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      title: Text(
                        "${index + 1}-Test",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(Icons.check),
                    ),
                  )),
        ],
      ),
    );
  }
}
