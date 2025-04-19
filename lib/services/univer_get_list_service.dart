import 'package:dio/dio.dart';

class UniverGetListService {
  final Dio dio = Dio();

  Future<List<UniverModel>> getUniverList() async {
    final response = await dio
        .get('https://student.buxdu.uz/rest/v1/public/university-list');

    if (response.statusCode == 200) {
      final data = response.data['data'];
      return data
          .map<UniverModel>((json) => UniverModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to fetch univer list');
    }
  }
}

// {
//     "success": true,
//     "error": null,
//     "data": [
//         {
//             "code": "387",
//             "name": "A.Avloniy nomidagi pedagogik mahorat milliy instituti",
//             "api_url": "https://student.avloniy.uz/rest/v1/",
//             "student_url": "https://student.avloniy.uz/",
//             "employee_url": "https://hemis.avloniy.uz/",
//             "university_type": "13",
//             "version_type": "11"
//         },
class UniverModel {
  String name;
  String apiUrl;

  UniverModel({required this.name, required this.apiUrl});
  factory UniverModel.fromJson(Map<String, dynamic> json) {
    return UniverModel(
      name: json['name'] ?? "null",
      apiUrl: json['api_url'] ?? "null",
    );
  }
}
