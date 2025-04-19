import 'package:bio_app/data/color.dart';
import 'package:bio_app/core/constants/urls.dart';
import 'package:bio_app/core/context_extension.dart';
import 'package:bio_app/core/data/local/token_storage.dart';
import 'package:bio_app/core/di/di.dart';
import 'package:bio_app/data/text_style.dart';
import 'package:bio_app/pages/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  final String apiUrl;
  const LoginPage({super.key, required this.apiUrl});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginService loginService = LoginService();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: kBoxDecoration,
        child: Form(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .6.h,
              width: MediaQuery.of(context).size.width * .95.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r), color: kwhite),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                child: Column(
                  spacing: 20.h,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Kirish",
                      style: TS.tsB(30.sp),
                    ),
                    textField(true, _emailController),
                    textField(false, _passwordController),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Password yangilash",
                        style: TextStyle(color: kMainColor, height: 0),
                      ),
                    ),
                    isLoading
                        ? CircularProgressIndicator()
                        : InkWell(
                            onTap: () async {
                              if (_emailController.text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty) {
                                setState(() {
                                  isLoading = true;
                                });
                                loginService.login(
                                    _emailController.text,
                                    _passwordController.text,
                                    widget.apiUrl,
                                    context);
                                setState(() {
                                  isLoading = false;
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Iltimos barcha maydonlarni to'ldiring")),
                                );
                              }
                            },
                            child: Center(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TS.tsBCW(20.sp),
                                ),
                              ),
                            )),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField textField(bool isEmail, TextEditingController controller) {
    return TextFormField(
        controller: controller,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(),
          prefixIcon: Icon(isEmail ? Icons.person : Icons.lock),
          hintText: isEmail ? "Username" : "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.r),
              borderSide: BorderSide(width: 4.w, color: kMainColor)),
        ));
  }
}

class LoginService {
  final Dio dio = sl<Dio>();
  final TokenStorage tokenStorage = sl<TokenStorage>();
  Future<void> login(String email, String password, String apiUrl,
      BuildContext context) async {
    try {
      final response = await dio.post(
        AppUrls.login,
        data: {
          'username': email,
          'password': password,
          'api_url': "https://student.buxdu.uz/rest/v1/",
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      print(response.data);

      if (response.statusCode == 200) {
        await tokenStorage.putToken(response.data['access']);
        await tokenStorage.putRefreshToken(response.data['refresh']);
        await tokenStorage.putUserId(response.data['user_id']);
        await tokenStorage.putUsername(response.data['username']);
        context.pushAndRemoveUntil(const HomeScreen());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${response.data} ${response.statusCode}")),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
