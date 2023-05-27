import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

void consoleLog(
    {required String tag, required String message, bool showFullLog = false}) {
  if (showFullLog) {
    log("$tag : $message");
  } else {
    if (kDebugMode) {
      debugPrint("$tag : $message");
    }
  }
}

Future<File> saveImageToTempStorage(File filePath) async {
  Uint8List imageBytes = await filePath.readAsBytes();
  String dir;
  if (Platform.isIOS) {
    dir = (await getApplicationDocumentsDirectory()).path;
  } else {
    dir = (await getExternalStorageDirectories())![0].path;
  }

  final currentTimeMillisecond =
      DateTime.now().millisecondsSinceEpoch.toString();
  File file = File(
      '$dir/${currentTimeMillisecond.substring(currentTimeMillisecond.length - 6)}_cou_cou.${filePath.path.split(".").last}');
  await file.writeAsBytes(imageBytes);
  return file;
}

Future<File> saveUint8ListToTempStorage(Uint8List filePath) async {
  String dir;
  if (Platform.isIOS) {
    dir = (await getApplicationDocumentsDirectory()).path;
  } else {
    dir = (await getExternalStorageDirectories())![0].path;
  }

  final currentTimeMillisecond =
      DateTime.now().millisecondsSinceEpoch.toString();
  File file = File(
      '$dir/${currentTimeMillisecond.substring(currentTimeMillisecond.length - 6)}_cou_cou.png');
  await file.writeAsBytes(filePath);
  return file;
}

String getDifferenceOfPeriodForNews(String postedDate) {
  DateTime dob = DateTime.parse(postedDate);
  Duration dur = DateTime.now().difference(dob);

  if (dur.inDays >= 1) {
    return dur.inDays.toString() + " days ago";
  }
  if (dur.inHours >= 1) {
    return dur.inHours.toString() + " hrs ago";
  } else if (dur.inMinutes > 0 && dur.inMinutes < 60) {
    return dur.inMinutes.toString() + " mins ago";
  } else {
    return "0" + " mins ago";
  }
}

launchUrlType(String type,
    {String email = "",
    String subject = "",
    String url = "",
    String phoneNumber = "",
    String smsBody = ""}) async {
  if (type == "email") {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        'subject': subject,
      }),
    );

    await launchUrl(emailLaunchUri);
  } else if (type == "url") {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  } else if (type == "sms") {
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: <String, String>{
        'body': smsBody,
      },
    );

    await launchUrl(smsLaunchUri);
  } else if (type == "telephone") {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}

// Future<List<String>> uploadImageToCloudStorage(List<String> _imageFile) async {
//
// }
