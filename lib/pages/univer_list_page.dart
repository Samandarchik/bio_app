import 'package:bio_app/data/color.dart';
import 'package:bio_app/core/context_extension.dart';
import 'package:bio_app/pages/login_page.dart';
import 'package:bio_app/services/univer_get_list_service.dart';
import 'package:flutter/material.dart';

class UniverListPage extends StatefulWidget {
  const UniverListPage({super.key});

  @override
  State<UniverListPage> createState() => _UniverListPageState();
}

class _UniverListPageState extends State<UniverListPage> {
  UniverGetListService univerGetListService = UniverGetListService();
  List<UniverModel?> univerList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUniverList();
  }

  Future<void> fetchUniverList() async {
    try {
      final data = await univerGetListService.getUniverList();
      setState(() {
        univerList = data;
      });
    } catch (e) {
      print('Xatolik yuz berdi: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: EdgeInsets.all(10),
          decoration: kBoxDecoration,
          child: ListView.builder(
            itemCount: univerList.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => context.push(LoginPage(
                apiUrl: univerList[index]!.apiUrl,
              )),
              child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: kwhite, borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(univerList[index]!.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ))),
            ),
          )),
    );
    // onTap: () => context.push(LoginPage()),
  }
}
