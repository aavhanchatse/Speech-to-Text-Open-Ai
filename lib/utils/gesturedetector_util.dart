import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GestureDetectorUtil {
  static void onScreenTap() {
    FocusScopeNode currentFocus = FocusScope.of(Get.context!);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}