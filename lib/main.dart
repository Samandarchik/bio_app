import 'package:bio_app/core/context_extension.dart';
import 'package:bio_app/core/data/local/token_storage.dart';
import 'package:bio_app/core/di/di.dart';
import 'package:bio_app/screen/home_screen.dart';
import 'package:bio_app/screen/univer_list_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInit();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: TopicAdd(),
      home: Loding(),
    );
  }
}

class Loding extends StatefulWidget {
  const Loding({super.key});

  @override
  State<Loding> createState() => _LodingState();
}

class _LodingState extends State<Loding> {
  TokenStorage tokenStorage = sl<TokenStorage>();

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    context.pushAndRemoveUntil(tokenStorage.getRefreshToken().isNotEmpty
        ? const HomeScreen()
        : const UniverListPage());
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
