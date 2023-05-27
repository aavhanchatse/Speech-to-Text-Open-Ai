import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openaispeech/app_constants/constants.dart';


class DatePickerUtil {
  static Future<DateTime?> getMaterialDatePicker(
      [int initialDate = 4,
      int lastDate = 4,
      int firstDate = 1900,
      isForDob = true]) async {
    DateTime? date = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime(DateTime.now().year - initialDate),
        firstDate: DateTime(firstDate),
        lastDate: DateTime(isForDob
            ? (DateTime.now().year - lastDate)
            : (DateTime.now().year + lastDate)),
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDatePickerMode: DatePickerMode.day,
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Constants.primaryColor,
              colorScheme: ColorScheme.light(primary: Constants.primaryColor),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        });

    return date;
  }

  static Future<DateTime?> getMaterialDatePickerForCustomDate({
    required DateTime initialDate,
    required int lastDate,
    required int firstDate,
  }) async {
    DateTime? date = await showDatePicker(
        context: Get.context!,
        initialDate: initialDate,
        firstDate: DateTime.now().subtract(Duration(days: firstDate)),
        lastDate: DateTime.now().add(Duration(days: lastDate)),
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDatePickerMode: DatePickerMode.day,
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Constants.primaryColor,
              colorScheme: ColorScheme.light(primary: Constants.primaryColor),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        });

    return date;
  }

  static Future<TimeOfDay?> getMaterialTimePicker() async {
    TimeOfDay? date = await showTimePicker(
        context: Get.context!,
        initialTime: const TimeOfDay(hour: 00, minute: 00),
        initialEntryMode: TimePickerEntryMode.inputOnly,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: Theme(
              data: ThemeData.light().copyWith(
                primaryColor: Constants.primaryColor,
                colorScheme: ColorScheme.light(primary: Constants.primaryColor),
                buttonTheme:
                    const ButtonThemeData(textTheme: ButtonTextTheme.primary),
              ),
              child: child!,
            ),
          );
        });

    return date;
  }
}
