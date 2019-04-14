import 'dart:async';
import 'dart:convert';
import 'package:gmail/model/email.dart';
import 'package:gmail/model/file.dart';
import 'package:http/http.dart' as http;

class EmailService {
  Future<List<Email>> getInboxEmails(String accessToken, int nbMessages) async {
    List<Email> emailSummarylist = [];

    final responseEmailList = await http.get(
        'https://www.googleapis.com/gmail/v1/users/me/messages?labelIds=INBOX&maxResults=$nbMessages&q=category:primary',
        headers: {'Authorization': 'Bearer $accessToken'});

    if (responseEmailList.statusCode == 200) {
      // Retrieve the list of messages
      List<dynamic> emailList = json.decode(responseEmailList.body)['messages'];
      List<Future<http.Response>> futures = [];

      // Retrieve the full message
      for (var message in emailList) {
        futures.add(http.get(
            'https://www.googleapis.com/gmail/v1/users/me/messages/${message["id"]}?format=full',
            headers: {'Authorization': 'Bearer $accessToken'}));
      }

      // Wait all message requests
      var responses = await Future.wait(futures);

      // Process each emails to take the information that we want to keep
      for (var response in responses) {
        if (response.statusCode == 200) {
          var message = json.decode(response.body);
          String object = "";
          String title = "";
          String body = "";
          List<File> attachedFileList = [];
          bool isRead = true;
          DateTime date = DateTime.fromMillisecondsSinceEpoch(
              int.parse(message["internalDate"]));

          if(message["payload"]["body"] != null && message["payload"]["body"]["data"] != null) {
            body = message["payload"]["body"]["data"];
          }

          List<dynamic> headerList = message['payload']['headers'];
          List<dynamic> fileList = message['payload']['parts'];
          List<dynamic> labelList = message['labelIds'];

          if(fileList != null) {
            for (var file in fileList) {
              String fileName;
              String mimeType;

              if (file["filename"] != "") {
                fileName = file["filename"];
              }

              if (file["mimeType"] != "") {
                mimeType = file["mimeType"];
              }

              if (fileName != null && mimeType != null) {
                attachedFileList.add(File(fileName, mimeType));
              }
            }
          }

          for (var label in labelList) {
            if (label == 'UNREAD') {
              isRead = false;
            }
          }

          for (var header in headerList) {
            if (header['name'].toString().toLowerCase() == 'subject') {
              object = header['value'];
            }

            if (header['name'].toString().toLowerCase() == 'from') {
              String value =
                  header['value'].toString().replaceAll(RegExp('\"'), "");

              if (value.contains('<')) {
                title = value.split('<')[0];
              } else {
                title = value;
              }
            }
          }

          emailSummarylist.add(Email(message["id"], title, date, object,
              body, isRead, attachedFileList));
        } else {
          throw Exception('Error');
        }
      }

      return emailSummarylist;
    } else {
      throw Exception('Error');
    }
  }
}
