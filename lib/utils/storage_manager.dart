import 'package:get_storage/get_storage.dart';

class StorageManager {
  final box = GetStorage('pinktree_box');

  String SPLASH = 'splash';
  String TOKEN = 'token';
  String USER_DATA = 'user_data';
  String USER_ID = 'user_id';
  String DOCTOR_DATA = 'doctor_data';
  String DOCTOR_ID = 'doctor_id';

  String ACT_RECORD = 'act_record';
  String CAT_RECORD = 'cat_record';
  String CERT_RECORD = 'cert_record';
  String MRC_RECORD = 'mrc_record';
  String SLEEP_TEST_RECORD = 'sleep_test_record';
  String COMPANION_RECORD = 'companion_record';
  String BMI_RECORD = 'bmi_record';
  String ACTION_PLAN_RECORD = 'action_plan_record';
  String LAST_HOSPITALISATION_RECORD = 'hospitalisation_record';
  String SIX_MIN_WALK_RECORD = 'six_min_walk_record';
  String SABA_RECORD = 'saba_record';
  String SYMPTOMS_RECORD = 'symptoms_record';
  String SIDE_EFFECT_RECORD = 'side_effect_record';
  String SLEEP_QUESTION_RECORD = 'sleep_question_record';
  String DEVICE_READING_RECORD = 'device_reading_record';
  String DIET_UPDATE_RECORD = 'diet_update_record';
  String DOCTOR_RECORD = 'doctor_record';
  String EVENT_RECORD = 'event_record';
  String NUDGE_RECORD = 'nudge_record';
  String LEADERBOARD_RECORD = 'leaderboard_record';
  String WEATHER_RECORD = 'weather_record';
  String REPORT_RECORD = 'report_record';

  void setInroScreenValue() {
    setData(SPLASH, true);
  }

  bool? getIntoScreenValue() {
    bool? value = getData(SPLASH);
    return value;
  }

  void setToken(String token) {
    setData(TOKEN, token);
  }

  String? getToken() {
    String token = getData(TOKEN);
    return token;
  }

  // void setUserData(UserData userData) {
  //   setData(USER_DATA, userData.toJson());
  //   setUserId(userData.id!);
  // }

  // UserData? getUserData() {
  //   var data = getData(USER_DATA);
  //   if (data != null) {
  //     return UserData.fromJson(data);
  //   } else {
  //     return null;
  //   }
  // }

  // void setUserId(String id) {
  //   setData(USER_ID, id);
  // }

  // String getUserId() {
  //   String id = getData(USER_ID);
  //   return id;
  // }

  // void setDoctorData(DoctorData doctorData) {
  //   setData(DOCTOR_DATA, doctorData.toJson());
  //   setDoctorId(doctorData.id!);
  // }

  // DoctorData? getDoctorData() {
  //   var data = getData(DOCTOR_DATA);
  //   if (data != null) {
  //     return DoctorData.fromJson(data);
  //   } else {
  //     return null;
  //   }
  // }

  // void setDoctorId(String id) {
  //   setData(DOCTOR_ID, id);
  // }

  // String getDoctorId() {
  //   String id = getData(DOCTOR_ID);
  //   return id;
  // }

  // --------- default functions ---------
  void setData(String key, dynamic value) {
    box.write(key, value);
    box.save();
  }

  dynamic getData(String key) {
    return box.read(key);
  }

  dynamic clearData() {
    box.erase();
  }

  void eraseStorage() async {
    await box.erase();
  }
}
