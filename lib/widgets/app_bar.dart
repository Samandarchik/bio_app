// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class TopicScreen extends StatelessWidget {
//   VoidCallback ontap;

//   TopicScreen({super.key, required this.ontap});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Mavzular ro'yxati"),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('topics')
//             .orderBy('timestamp', descending: false)
//             .snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text("Hozircha hech qanday mavzu yo'q"));
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               var topicDoc = snapshot.data!.docs[index];
//               var topicData = topicDoc.data() as Map<String, dynamic>;
//               var topicTitle = topicData['topic'] ?? 'No title';

//               return ListTile(
//                   title: Text(topicTitle),
//                   subtitle: Text(
//                       "Savollar soni: ${topicData['questions']?.length ?? 0}"),
//                   onTap: ontap);
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class QuestionsPage extends StatefulWidget {
//   final Map<String, dynamic>? topicData;

//   QuestionsPage({required this.topicData});

//   @override
//   _QuestionsPageState createState() => _QuestionsPageState();
// }

// class _QuestionsPageState extends State<QuestionsPage> {
//   // Foydalanuvchidan javoblarni saqlash uchun
//   Map<String, String> userAnswers = {};

//   // Savollarga javobni tekshirish
//   void submitQuiz() {
//     Map<String, String> incorrectAnswers = {};
//     widget.topicData!.forEach((key, value) {
//       if (userAnswers[key] != value['answer']) {
//         incorrectAnswers[key] = value['answer'];
//       }
//     });

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ResultPage(
//           incorrectAnswers: incorrectAnswers,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Savollar"),
//       ),
//       body: widget.topicData == null
//           ? Center(child: Text("Savollar topilmadi"))
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: widget.topicData!.length,
//                     itemBuilder: (context, index) {
//                       var questionKey = widget.topicData!.keys.elementAt(index);
//                       var questionData = widget.topicData![questionKey];

//                       return Card(
//                         margin: EdgeInsets.all(10),
//                         child: Padding(
//                           padding: EdgeInsets.all(10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 questionData['ques'] ?? "Savol",
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(height: 10),
//                               RadioListTile<String>(
//                                 title: Text("A: ${questionData['a']}"),
//                                 value: "a",
//                                 groupValue: userAnswers[questionKey],
//                                 onChanged: (value) {
//                                   setState(() {
//                                     userAnswers[questionKey] = value!;
//                                   });
//                                 },
//                               ),
//                               RadioListTile<String>(
//                                 title: Text("B: ${questionData['b']}"),
//                                 value: "b",
//                                 groupValue: userAnswers[questionKey],
//                                 onChanged: (value) {
//                                   setState(() {
//                                     userAnswers[questionKey] = value!;
//                                   });
//                                 },
//                               ),
//                               RadioListTile<String>(
//                                 title: Text("C: ${questionData['c']}"),
//                                 value: "c",
//                                 groupValue: userAnswers[questionKey],
//                                 onChanged: (value) {
//                                   setState(() {
//                                     userAnswers[questionKey] = value!;
//                                   });
//                                 },
//                               ),
//                               RadioListTile<String>(
//                                 title: Text("D: ${questionData['d']}"),
//                                 value: "d",
//                                 groupValue: userAnswers[questionKey],
//                                 onChanged: (value) {
//                                   setState(() {
//                                     userAnswers[questionKey] = value!;
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: submitQuiz,
//                   child: Text('Natijani ko\'rish'),
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//     );
//   }
// }

// class ResultPage extends StatelessWidget {
//   final Map<String, String> incorrectAnswers;

//   ResultPage({required this.incorrectAnswers});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Natijalar'),
//       ),
//       body: ListView(
//         children: [
//           if (incorrectAnswers.isEmpty)
//             Center(
//                 child: Text('Siz barcha savollarga to\'g\'ri javob berdingiz!'))
//           else
//             ...incorrectAnswers.entries.map((entry) {
//               return ListTile(
//                 title: Text(
//                   'Savol: ${entry.key}',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Text('To\'g\'ri javob: ${entry.value.toUpperCase()}'),
//               );
//             }).toList(),
//         ],
//       ),
//     );
//   }
// }
