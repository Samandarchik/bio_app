import 'package:bio_app/core/data/local/token_storage.dart';
import 'package:bio_app/core/di/di.dart';
import 'package:bio_app/data/color.dart';
import 'package:bio_app/pages/home_screen.dart';
import 'package:bio_app/pages/univer_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInit();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // sl<TokenStorage>().removeRefreshToken();
  // sl<TokenStorage>().removeToken();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            theme: ThemeData(
                scaffoldBackgroundColor: kwhite,
                appBarTheme: const AppBarTheme(
                    backgroundColor: kwhite,
                    centerTitle: true,
                    surfaceTintColor: kwhite)),
            debugShowCheckedModeBanner: false,
            home: Loding());
      },
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

  // Future<void> init() async {
  //   await Future.delayed(const Duration(seconds: 0));
  //   context.pushAndRemoveUntil(tokenStorage.getToken().isNotEmpty
  //       ? const HomeScreen()
  //       : const UniverListPage());
  // }

  // @override
  // void initState() {
  //   init();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return tokenStorage.getToken().isNotEmpty
        ? const HomeScreen()
        : const UniverListPage();
  }
}
