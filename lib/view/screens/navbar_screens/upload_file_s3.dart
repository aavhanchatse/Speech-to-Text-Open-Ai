import 'dart:io';

import 'package:aws_s3_upload/aws_s3_upload.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openaispeech/utils/appbar_util.dart';

class UploadFileS3 extends StatefulWidget {
  const UploadFileS3({super.key});

  @override
  State<UploadFileS3> createState() => _UploadFileS3State();
}

class _UploadFileS3State extends State<UploadFileS3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtil.commonAppBar("Upload Video"),
      body: Center(
        child: FilledButton(
          onPressed: () {
            _pickVideo();
          },
          child: Text("Pick & Upload Video"),
        ),
      ),
    );
  }

  void _pickVideo() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      debugPrint('video.path: ${video.path}');
      _uploadVideo(video.path);
    }
  }

  void _uploadVideo(String path) async {
    String regionName = 'ap-south-1';
    String accessKey = 'AKIA2I2EIAE4UUMUSYOO';
    String secretKey = '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';
    String bucketname = 'surveilancesystem';

    final result = await AwsS3.uploadFile(
      accessKey: accessKey,
      secretKey: secretKey,
      file: File(path),
      bucket: bucketname,
      region: regionName,
      destDir: "uploads/public",
      metadata: {"test": "test"},
    );

    if (result != null) {
      debugPrint('result: $result');
    }
  }
}
