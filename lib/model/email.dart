import 'package:gmail/model/file.dart';

class Email {
  String id;
  String title;
  DateTime date;
  String object;
  String message;
  bool isRead;
  List<File> fileList;

  Email(String id, String title, DateTime date, String object,
      String message, bool isRead, List<File> fileList) {
    this.id = id;
    this.title = title;
    this.date = date;
    this.object = object;
    this.message = message;
    this.isRead = isRead;
    this.fileList = fileList;
  }
}