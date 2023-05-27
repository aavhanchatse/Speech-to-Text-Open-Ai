part of constants;

/// all endpoint api
class ApiPath {
  static const ENVIRONMENT = "devo";
  static const baseURL = "http://app.pinktree-api.com.alotechnow.com";
  // static const baseURL = "https://a4ce-103-198-165-141.in.ngrok.io";

  static const TERMS_CONDITION =
      "http://app.pinktree-admin-panels.com.alotechnow.com/terms-and-conditions";
  static const PRIVACY_POLICY =
      "http://app.pinktree-admin-panels.com.alotechnow.com/privacy-policy";

  static const SUPPORT_EMAIL = "support@pinktree.co";

  static const checkLoginPatient = "/api/checkLoginPatient";
  static const checkLoginDoctor = "/api/checkLoginDoctor";
  static const createDeviceInfo = "/api/createDeviceInfo";
  static const logoutUser = "/api/deleteDeviceInfo";
  static const createPatient = "/api/createPatient";
  static const createDoctor = "/api/createDoctor";
  static const listAllDisease = "/api/listDisease";
  static const selectDisease = "/api/createPatientDisease";
  static const getUserInfo = "/api/getUserInfo";
  static const listDoctor = "/api/listDoctor";
  static const detailsDoctor = "/api/detailsDoctor";
  static const selectDoctor = "/api/createPatientDoctor";
  static const getPatientListFromDoctorId = "/api/getPatientListFromDoctorId";
  static const getDoctorInfo = "/api/getDoctorInfo";
  static const getActivitiesFromDiseaseId = "/api/getActivitiesFromDiseaseId";
  static const getGoalsFromDiseaseId = "/api/getGoalsFromDiseaseId";
  static const getVideosFromDiseaseId = "/api/getVideosFromDiseaseId";
  static const getActivityFromGoal = "/api/getActivitiesFromGoalId";
  static const createPatientActivity = "/api/createPatientActivity";
  static const createPatientGoal = "/api/createPatientGoal";
  static const getPatientActivity = "/api/getPatientActivities";
  static const getPatientReport = "/api/getPatientReport";
  static const uploadPatientReport = "/api/uploadPatientReport";
  static const getSymptomsFromDiseaseId = "/api/getSymptomsFromDiseaseId";
  static const createPatientSymptom = "/api/createPatientSymptom";
  static const getMedicationsFromDiseaseId = "/api/getMedicationsFromDiseaseId";
  static const createPatientMedication = "/api/createPatientMedication";
  static const getPatientMedication = "/api/getPatientMedication";
  static const listMedication = "/api/listMedication";
  static const createSabaLogs = "/api/createSabaLogs";
  static const listSabaLogs = "/api/listSabaLogs";
  static const listBanner = "/api/listBanner";
  static const getSideEffectsFromDiseaseId = "/api/getSideEffectsFromDiseaseId";
  static const createPatientSideEffect = "/api/createPatientSideEffect";
  static const uploadPatientBmi = "/api/uploadPatientBmi";
  static const uploadSixMinWalkTest = "/api/uploadSixMinWalkTest";
  static const uploadLastHospitalisation = "/api/uploadLastHospitalisation";
  static const getPatientDietPlanRecord = "/api/getPatientDietPlanRecord";
  static const uploadPatientDietPlan = "/api/uploadPatientDietPlan";
  static const uploadPatientFeelingRecord = "/api/uploadPatientFeelingRecord";
  static const getCompanionList = "/api/getCompanionList";
  static const createFriendRequest = "/api/createFriendRequest";
  static const getSentFriendsRequestData = "/api/sentFriendRequestList";
  static const receivedFriendRequestList = "/api/receivedFriendRequestList";
  static const rejectFriendRequest = "/api/rejectFriendRequest";
  static const acceptFriendRequest = "/api/acceptFriendRequest";
  static const actQuizDataRequest = "/testFiles/asthmaTest.json";
  static const sleepinessQuizDataRequest = "/testFiles/sleepApneaTest.json";
  static const catQuizDataRequest = "/testFiles/copdTest.json";
  static const uploadPatientSleepRecord = "/api/uploadPatientSleepRecord";
  static const uploadPatientPartnerSleepRecord =
      "/api/uploadPatientPartnerSleepRecord";
  static const uploadPatientWellRestedRecord =
      "/api/uploadPatientWellRestedRecord";
  static const uploadPatientSleepQualityRecord =
      "/api/uploadPatientSleepQualityRecord";
  static const getPatientFeelingRequest = "/api/getPatientFeelingRecord";
  static const getPatientSleepRecord = "/api/getPatientSleepRecord";
  static const getPatientPartnerSleepRecord =
      "/api/getPatientPartnerSleepRecord";
  static const getPatientWellRestedRecord = "/api/getPatientWellRestedRecord";
  static const getPatientSleepQualityRecord =
      "/api/getPatientSleepQualityRecord";
  static const createTestRequest = "/api/createTest";
  static const getSleepTags = "/testFiles/sleepTags.json";
  static const createSleepTags = "/api/createSleepTags";
  static const getPatientSleepTags = "/api/getLimitedSleepTags";
  static const updateCpap = "/api/uploadPatientCpapRecord";
  static const getPatientCpapRecord = "/api/getPatientCpapRecord";
  static const uploadPatientSleepHoursRecord =
      "/api/uploadPatientSleepHoursRecord";
  static const getPatientSleepHoursRecord = "/api/getPatientSleepHoursRecord";
  static const getAirQuality =
      "https://www.weathertrends360.com/api/aan/forecast/indices?l=ST1394&sd=20230215000000";
  static const uploadPatientDeviceReadingRecord =
      "/api/uploadPatientDeviceReadingRecord";
  static const getPatientDeviceReadingRecord =
      "/api/getPatientDeviceReadingRecord";
  static const listFaq = "/api/listFaq";
  static const listBlog = "/api/listBlog";
  static const listRating = "/api/listRatings";
  static const createRating = "/api/createRating";
  static const verifyEmail = "/api/verifyEmail";
  static const getTodayMedicationLogData = "/api/getDailyMedication";
  static const saveDailyMedication = "/api/saveDailyMedication";
  static const getDailyActivity = "/api/getDailyActivity";
  static const saveDailyActivity = "/api/saveDailyActivity";
  static const getAllTests = "/api/getAllTests";
  static const listPatientSymptom = "/api/listPatientSymptom";
  static const getAllDailyMedication = "/api/getAllDailyMedication";
  static const getAllDailyActivity = "/api/getAllDailyActivity";
  static const saveDailySaba = "/api/saveDailySaba";
  static const getAllDailySaba = "/api/getAllDailySaba";
  static const getStateData = "/addressFiles/state_list.json";
  static const getActivityCompletionPercentage =
      "/api/getActivityCompletionPercentage";
  static const createDemoRequest = "/api/createDemoRequest";
  static const getDemoRequests = "/api/getDemoRequests";
  static const getPatientLastHospitalisationRecord =
      "/api/getPatientLastHospitalisationRecord";
  static const listPatientSideEffect = "/api/listPatientSideEffect";
  static const deletePatientDoctor = "/api/deletePatientDoctor";
  static const getNudges = "/api/getNudges";
  static const createNudge = "/api/createNudge";
  static const removeCompanion = "/api/removeCompanion";
  static const bulkChangeNudgeStatus = "/api/bulkChangeNudgeStatus";
  static const deletePatientGoal = "/api/deletePatientGoal";
  static const deletePatientActivity = "/api/deletePatientActivity";
  static const getPatientBmi = "/api/getPatientBmi";
  static const updateLeaderboardScore = "/api/updateLeaderboardScore";
  static const getLeaderBoardDetails = "/api/getLeaderBoardDetails";
  static const getLeaderboardAnalysis = "/api/getLeaderboardAnalysis";
  static const getSleepTagByPatient = "/api/getSleepTags";
  static const getPatientDeviceReadingReport =
      "/api/getPatientDeviceReadingRecord";
  static const getProfessionData = "/professions.json";
  static const getPatientFinalReport = "/api/getPatientFinalReport";
  static const createTestReport = "/api/createTestReport";
  static const sendFinalReport = "/api/sendFinalReport";
  static const getTestReports = "/api/getTestReports";
  static const getPatientSixMinWalkTest = "/api/getPatientSixMinWalkTest";
  static const listPatientBPReadings = "/api/listPatientBPReadings";
  static const createPatientBPReading = "/api/createPatientBPReading";
  static const createEvent = "/api/createEvent";
  static const listDoctorEvents = "/api/listDoctorEvents";
  static const getEventsForPatient = "/api/getEventsForPatient";
  static const createPatientEvent = "/api/createPatientEvent";
  static const listPatientEventLogs = "/api/listPatientEventLogs";
  static const listDoctorEventLogs = "/api/listDoctorEventLogs";
}
