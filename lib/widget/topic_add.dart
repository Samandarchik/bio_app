// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Topic extends StatefulWidget {
//   const Topic({super.key});

//   @override
//   State<Topic> createState() => _TopicAddState();
// }

// class _TopicAddState extends State<Topic> {
//   TextEditingController topicNumber = TextEditingController();
//   TextEditingController numberques = TextEditingController();
//   TextEditingController textques = TextEditingController();
//   TextEditingController a = TextEditingController();
//   TextEditingController b = TextEditingController();
//   TextEditingController c = TextEditingController();
//   TextEditingController d = TextEditingController();
//   TextEditingController answer = TextEditingController();

//   // savol va javoblarni Firestore'ga yuborish
//   uploadQues() async {
//     if (topicNumber.text.isNotEmpty &&
//         numberques.text.isNotEmpty &&
//         textques.text.isNotEmpty &&
//         a.text.isNotEmpty &&
//         b.text.isNotEmpty &&
//         c.text.isNotEmpty &&
//         d.text.isNotEmpty &&
//         answer.text.isNotEmpty) {
//       Map<String, dynamic> addQues = {
//         "numques": numberques.text,
//         "ques": {
//           "ques": textques.text,
//           "a": a.text,
//           "b": b.text,
//           "c": c.text,
//           "d": d.text,
//         },
//         "answer": answer.text, // To'g'ri javobni qo'shyapmiz
//       };

//       // Firestore'ga qo'shish
//       await FirebaseFirestore.instance
//           .collection('topic')
//           .doc(topicNumber.text)
//           .collection(
//               "questions") // Savollarni sub-kolleksiya sifatida qo'shish
//           .doc(numberques.text) // Savolni hujjat sifatida qo'shish
//           .set(addQues)
//           .then((value) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("Savol qo'shildi!")));
//       }).catchError((error) {
//         print(error);
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("Xatolik yuz berdi: $error")));
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Iltimos, barcha maydonlarni to'ldiring.")));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Savol qo'shish")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: topicNumber,
//               decoration: InputDecoration(
//                   hintText: "Nechinchi Mavzu", labelText: "Nechinchi Mavzu"),
//             ),
//             TextField(
//               controller: numberques,
//               decoration: InputDecoration(
//                   hintText: "Nechinchi Savol", labelText: "Nechinchi Savol"),
//             ),
//             TextField(
//               controller: textques,
//               decoration: InputDecoration(
//                 hintText: "Savol",
//                 labelText: "Savol",
//               ),
//             ),
//             TextField(
//               controller: a,
//               decoration: InputDecoration(
//                   hintText: "A variant", labelText: "A variant"),
//             ),
//             TextField(
//               controller: b,
//               decoration: InputDecoration(
//                   hintText: "B variant", labelText: "B variant"),
//             ),
//             TextField(
//               controller: c,
//               decoration: InputDecoration(
//                   hintText: "C variant", labelText: "C variant"),
//             ),
//             TextField(
//               controller: d,
//               decoration: InputDecoration(
//                   hintText: "D variant", labelText: "D variant"),
//             ),
//             TextField(
//               controller: answer,
//               decoration: InputDecoration(
//                   hintText: "To'g'ri javob", labelText: "To'g'ri javob"),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: uploadQues,
//               child: Text("Qo'shish"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
