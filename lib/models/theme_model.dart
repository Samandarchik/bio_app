class ThemeModel {
  final int id;
  final List<AssignmentModel> assignments;
  final SubjectModel subject;
  final String title;
  final String? comment;
  final String content;
  final String file;
  final String? audio;
  final String? prezintatsiya;
  final String? iframe;
  final int testNum;

  ThemeModel({
    required this.id,
    required this.assignments,
    required this.subject,
    required this.title,
    required this.comment,
    required this.content,
    required this.file,
    required this.audio,
    required this.prezintatsiya,
    required this.iframe,
    required this.testNum,
  });

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      id: json['id'],
      assignments: (json['assigments'] as List)
          .map((e) => AssignmentModel.fromJson(e))
          .toList(),
      subject: SubjectModel.fromJson(json['subject']),
      title: json['title'],
      comment: json['comment'],
      content: json['content'],
      file: json['file'],
      audio: json['audio'],
      prezintatsiya: json['prezintatsiya'],
      iframe: json['iframe'],
      testNum: json['test_num'],
    );
  }
}

class AssignmentModel {
  final int id;
  final String title;
  final String content;
  final int theme;

  AssignmentModel({
    required this.id,
    required this.title,
    required this.content,
    required this.theme,
  });

  factory AssignmentModel.fromJson(Map<String, dynamic> json) {
    return AssignmentModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      theme: json['theme'],
    );
  }
}

class SubjectModel {
  final String id;
  final String createDate;
  final String updateDate;
  final String name;

  SubjectModel({
    required this.id,
    required this.createDate,
    required this.updateDate,
    required this.name,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'],
      createDate: json['create_date'],
      updateDate: json['update_date'],
      name: json['name'],
    );
  }
}
