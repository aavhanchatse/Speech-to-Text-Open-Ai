// import 'dart:io';

// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:amplify_storage_s3/amplify_storage_s3.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';

// // class S3Util {
// //   static Future<String?> uploadFileToAws(File local, String uploadPath) async {
// //     debugPrint('inside aws function');
// //     try {
// //       local.existsSync();

// //       S3UploadFileOptions options = S3UploadFileOptions(
// //         accessLevel: StorageAccessLevel.guest,
// //       );

// //       UploadFileResult result = await Amplify.Storage.uploadFile(
// //           local: local, key: uploadPath, options: options);

// //       debugPrint('result; $result');
// //       debugPrint('result.key: ${result.key}');

// //       final downloadUrl =
// //           "https://coucoustoragebucket152907-dev.s3.ap-south-1.amazonaws.com/public/${result.key}";

// //       return downloadUrl;
// //     } catch (e) {
// //       debugPrint('uploadError ===> ${e.toString()}');
// //       return null;
// //     }
// //   }
// // }

// class FirebaseStorageUtil {
//   static Future<String?> uploadFileToFirebaseStorage(
//       File local, String uploadPath) async {
//     debugPrint('inside aws function');
//     try {
//       local.existsSync();

//       final Reference storage =
//           FirebaseStorage.instance.ref().child(uploadPath);
//       final data = await local.readAsBytes();
//       final UploadTask uploadTask = storage.putData(data);
//       final downloadUrl = await (await uploadTask).ref.getDownloadURL();

//       return downloadUrl;
//     } catch (e) {
//       debugPrint('uploadError ===> ${e.toString()}');
//       return null;
//     }
//   }
// }
