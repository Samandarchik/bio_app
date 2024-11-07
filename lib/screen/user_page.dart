import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TopicList extends StatefulWidget {
  const TopicList({super.key});

  @override
  State<TopicList> createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  // Firestore'dan barcha topic'larni olish
  Future<List<Map<String, dynamic>>> fetchAllTopics() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('topic') // topic kolleksiyasidan barcha hujjatlarni olish
          .get();

      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>) // Ma'lumotni olish
          .toList();
    } catch (e) {
      print("Error fetching topics: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mavzular ro'yxati")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchAllTopics(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Xatolik: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Hech qanday mavzu topilmadi.'));
            } else {
              List<Map<String, dynamic>> topics = snapshot.data!;
              return ListView.builder(
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(topics[index]['topicNumber'] ?? 'No Name'),
                      subtitle: Text(
                          topics[index]['description'] ?? 'No Description'),
                      onTap: () {
                        // Har bir topicga bosganda qo'shimcha amallar (masalan, ko'rsatish, tahrirlash) qilishingiz mumkin
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
