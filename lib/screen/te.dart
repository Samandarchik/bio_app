// import 'package:bio_app/widget/app_bar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class TopicAdd extends StatefulWidget {
//   @override
//   _TopicAddState createState() => _TopicAddState();
// }

// class _TopicAddState extends State<TopicAdd> {
//   final TextEditingController _topicController = TextEditingController();

//   // Firestore'ga ma'lumot yuklash funksiyasi
//   Future<void> uploadTopic() async {
//     String topicName = _topicController.text.trim();

//     if (topicName.isEmpty) {
//       // Agar mavzu bo'sh bo'lsa, xabar chiqarish
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Iltimos, mavzu kiriting")),
//       );
//       return;
//     }
//     // Example data for the new topic
//     Map<String, dynamic> newTopic = {
//       "topic": topicName,
//       "questions": {
//         "${ques.length + 1}": {
//           "ques": "Odamda nechta suyak bor",
//           "a": "320",
//           "b": "206",
//           "c": "200",
//           "d": "204",
//           "answer": "b"
//         },
//         "2": ques,
//         "3": {
//           "ques": "Odamda nechta ko'z bor",
//           "a": "32",
//           "b": "26",
//           "c": "20",
//           "d": "24",
//           "answer": "a"
//         }
//       },
//       'timestamp': FieldValue.serverTimestamp(), // timestamp qo'shish
//     };

//     try {
//       // Firestore'ga yangi mavzu qo'shish
//       await FirebaseFirestore.instance.collection('topics').add(newTopic);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Mavzu muvaffaqiyatli yuklandi")),
//       );
//       _topicController.clear(); // TextFieldni tozalash
//     } catch (e) {
//       // Agar xatolik yuz bersa, xabar chiqarish
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Xatolik yuz berdi: $e")),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _topicController.dispose();
//     super.dispose();
//   }

//   Map<String, String> ques = {};

//   @override
//   Widget build(BuildContext context) {
//     return TopicScreen(
//       ontap: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => AdminPanel()));
//       },
//     );
//   }
// }
// /**
//  *
//  *   ElevatedButton(
//               onPressed: uploadTopic,
//               child: Text("Firestore'ga Yuklash"),
//             ),
//  */

// class AdminPanel extends StatelessWidget {
//   const AdminPanel({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }
