import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addQuiz() async {
  // Firestore instanceini oling
  CollectionReference quizzes =
      FirebaseFirestore.instance.collection('quizzes');

  // Yangi hujjat qo'shing
  await quizzes.add({
    'title': 'My First Quiz',
    'questions': [
      {
        'text': 'What is Flutter?',
        'options': ['A Framework', 'A Language', 'An IDE'],
        'correctAnswer': 'A Framework'
      },
      {
        'text': 'What is Dart?',
        'options': ['A Bird', 'A Language', 'A Framework'],
        'correctAnswer': 'A Language'
      },
    ]
  });
}
