import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openaispeech/app_constants/constants.dart';
import 'package:openaispeech/utils/size_config.dart';
import 'package:openaispeech/view/screens/navbar_screens/home_screen.dart';
import 'package:openaispeech/view/screens/navbar_screens/navbar.dart';
import 'package:openaispeech/view/screens/navbar_screens/record_sound_screen.dart';
import 'package:openaispeech/view/screens/navbar_screens/speech_to_text_screen.dart';
import 'package:openaispeech/view/screens/navbar_screens/upload_file_s3.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: const Center(child: Text("Splash")),
      ),
    );
  }

  void _checkLogin() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(
        () => const UploadFileS3(),
        transition: Transition.fade,
        duration: const Duration(milliseconds: 300),
      );
    });
  }
}
