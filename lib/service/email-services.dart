import 'dart:async';
import 'dart:convert';
import 'package:gmail/model/email-summary.dart';
import 'package:http/http.dart' as http;

class EmailServices {
  static Future<List<EmailSummary>> getInboxEmails(String accessToken) async {
    List<EmailSummary> emailSummarylist = [];

    final responseEmailList = await http.get(
        'https://www.googleapis.com/gmail/v1/users/me/messages?labelIds=INBOX&maxResults=20&q=category:primary',
        headers: {'Authorization': 'Bearer $accessToken'});

    if (responseEmailList.statusCode == 200) {
      // Retrieve the list of messages
      List<dynamic> emailList = json.decode(responseEmailList.body)['messages'];

      // Retrieve the full message
      for (var message in emailList) {
        final responseEmail = await http.get(
            'https://www.googleapis.com/gmail/v1/users/me/messages/${message["id"]}?format=full',
            headers: {'Authorization': 'Bearer $accessToken'});

        if (responseEmail.statusCode == 200) {
          var message = json.decode(responseEmail.body);
          String object = "";
          String title = "";
          DateTime date = DateTime.fromMillisecondsSinceEpoch(
              int.parse(message["internalDate"]));

          List<dynamic> headerList = message['payload']['headers'];

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

          emailSummarylist.add(EmailSummary(
              message["id"], title, date, object, message["snippet"]));
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
