abstract class EndPoints {
  static String registerUser = 'api/users/register';

  static String loginUser = 'api/users/login';

  static String getCategories = 'api/categories/get-all';

  static String getStoryLine = 'api/clinics/stories/get-storyline-cards';

  static String getPosts(int pageId) =>
      'api/clinics/posts/get-posts-by-pagination?pageId=$pageId&pageCount=10';

  static String getPostDetails(int postId) =>
      'api/clinics/posts/get-post-details-by-id?postId=$postId';

  static String getStoryDetails(int clinicId) =>
      'api/clinics/stories/get-clinic-stories?clinicId=$clinicId';

  static String getClinicsByCategory(int categoryId) =>
      'api/clinics/get-clinic-by-category?categoryId=$categoryId';

  static String getClinicDetails(int clinicId) =>
      'api/clinics/get-clinic-details-by-id?clinicId=$clinicId';

  static String getClinicLocations(int clinicId) =>
      'api/clinics/get-clinic-locations?clinicId=$clinicId';

  static String getClinicInsurances(int clinicId) =>
      'api/clinics/get-clinic-insurances?clinicId=$clinicId';

  static String getClinicServices(int clinicId) =>
      'api/clinics/get-clinic-services?clinicId=$clinicId';

  static String addPostToFavorite(String userId, int postId) =>
      'api/users/add-post-to-favourites?userId=$userId&postId=$postId';

  static String removePostFromFavorite(String userId, int postId) =>
      'api/users/remove-post-from-favourites?userId=$userId&postId=$postId';

  static String getUserFavorite(String userId) =>
      'api/users/get-user-favourites?userId=$userId';

  static String getDoctorDetails(int docId, String userId) =>
      'api/doctors/get-doctor-details?doctorId=$docId&userId=$userId';

  static String getClinicUsingSearch = 'api/clinics/get-clinics-by-name-search';

  static String getPendingAppointment(String userId) =>
      "api/doctors/appointments/get-user-pending-appointments?userId=$userId";

  static String getConfirmedAppointment(String userId) =>
      "api/doctors/appointments/get-user-confirmed-appointments?userId=$userId";

  static String getAppointmentDetails(int appointmentId) =>
      "api/doctors/appointments/get-appointment-details?Id=$appointmentId";

  static String getDoctorByClinicId(int clinicId) =>
      'api/doctors/get-doctors-by-clinicId?clinicId=$clinicId';

  static String changeAppointmentDoctor(int appointmentId, int doctorId) =>
      "api/doctors/appointments/change-appointment-doctor?appointmentId=$appointmentId&doctorId=$doctorId";

  static String createAppointment =
      'api/doctors/appointments/create-appointment';

  static String getClinicsByLocation(double longitude, double latitude) =>
      "api/clinics/get-nearest-clinics-locations?longitude=$longitude&latitude=$latitude";

  static String editProfile = "api/users/update-user";

  static String socialAccounts =
      "api/settings/app/api/settings/app-social-accounts/get-accounts";

  static String recommendDoctor(int doctorId, bool recommend, String userId) =>
      "api/doctors/recommendations/recommend-doctor?doctorId=$doctorId&recommend=$recommend&userId=$userId";

  static String getDoctorRecommendation(int doctorId) =>
      "api/doctors/recommendations/get-doctor-recommendations?doctorId=$doctorId";

  static String getDoctorReviews(int doctorId) =>
      "api/doctors/reviews/get-doctor-reviews?doctorId=$doctorId";

  static String getNotification(int skipCount, bool seen) =>
      "api/notifications?IsSucceeded=false&IsSeen=$seen&MaxResult=10&Skip=$skipCount";

  static String createDoctorReview = "api/doctors/reviews/create-review";

  static String getClinicBeforeAfter(int pageId, int clinicId) =>
      'api/clinics/before-and-after/get-clinic-before-and-after'
      '?clinicId=$clinicId&pageId=$pageId&pageCount=10';

  static String changePassword = "api/users/change-password";
}
