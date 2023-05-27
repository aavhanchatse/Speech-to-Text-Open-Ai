import 'package:flutter/material.dart';
import 'package:openaispeech/app_constants/constants.dart';
import 'package:openaispeech/utils/decorated_input_border.dart';
import 'package:openaispeech/utils/hex_color_util.dart';
import 'package:openaispeech/utils/size_config.dart';

class StyleUtil {
  static BoxDecoration defaultBoxDecoration() {
    return BoxDecoration(
      color: Constants.primaryInputBgColor,
      borderRadius: BorderRadius.circular(2.h),
    );
  }

  static List<BoxShadow> primaryShadow() {
    return [
      BoxShadow(
        // color: Constants.shadowColor2,
        blurRadius: 4,
        // offset: const Offset(0, 0),
      )
      // BoxShadow(
      //   color: Constants.black.withOpacity(0.25),
      // ),
      // BoxShadow(
      //   color: Constants.white,
      //   blurRadius: 4,
      //   offset: const Offset(0, 4),
      // ),
    ];
  }

  static List<BoxShadow> cardShadow() {
    return [
      BoxShadow(
        // color: Constants.shadowColor,
        blurRadius: 12,
        offset: const Offset(0, 0),
      ),
    ];
  }

  static BoxShadow textFieldShadow() {
    return BoxShadow(
      // color: Constants.shadowColor2,
      blurRadius: 4,
      // offset: const Offset(0, 0),
    );
  }

  static List<BoxShadow> jobCardShadow() {
    return [
      BoxShadow(color: HexColor('C7C7DE').withOpacity(0.5), blurRadius: 8)
    ];
  }

  static primaryTextFieldDecoration({String? hintText, Widget? prefix}) {
    return InputDecoration(
      prefixIcon: prefix ?? null,
      counterText: '',
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
      hintText: hintText,
      hintStyle: TextStyle(color: Constants.primaryGrey),
      fillColor: Constants.white,
      filled: true,
      focusedBorder: primaryOutlineInputBorderLight(),
      enabledBorder: primaryOutlineInputBorderLight(),
      border: primaryOutlineInputBorderLight(),
      errorBorder: primaryOutlineInputBorderLight(),
      disabledBorder: primaryOutlineInputBorderLight(),
    );
  }

  static primaryDropDownDecoration({
    String? hintText,
    Widget? prefix,
    String? labelText,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: Constants.white,
      hintText: labelText,
      hintStyle: TextStyle(color: Constants.primaryGrey, fontSize: 15),
      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.w),
      focusedBorder: StyleUtil.primaryOutlineInputBorderLight(),
      enabledBorder: StyleUtil.primaryOutlineInputBorderLight(),
      border: StyleUtil.primaryOutlineInputBorderLight(),
      errorBorder: StyleUtil.primaryOutlineInputBorderLight(),
      disabledBorder: StyleUtil.primaryOutlineInputBorderLight(),
    );
  }

  static primaryDropDownDecoration2({
    String? hintText,
    Widget? prefix,
    String? labelText,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: Constants.primaryInputBgColor,
      hintText: labelText,
      hintStyle: TextStyle(color: Constants.primaryGrey, fontSize: 15),
      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.w),
      focusedBorder: StyleUtil.primaryOutlineInputBorderLight(),
      enabledBorder: StyleUtil.primaryOutlineInputBorderLight(),
      border: StyleUtil.primaryOutlineInputBorderLight(),
      errorBorder: StyleUtil.primaryOutlineInputBorderLight(),
      disabledBorder: StyleUtil.primaryOutlineInputBorderLight(),
    );
  }

  static defaultTextFieldBorder() {
    return DecoratedInputBorder(
      child: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.h)),
        borderSide: const BorderSide(color: Colors.transparent),
        // borderSide: BorderSide(color: Constants.primaryBorderColor, width: 1),
      ),
      shadow: StyleUtil.textFieldShadow(),
    );
  }

  static primaryOutlineInputBorderLight() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(2.h),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }

  static formTextFieldInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(2.h),
      borderSide: BorderSide(color: Colors.transparent),
    );
  }
}
