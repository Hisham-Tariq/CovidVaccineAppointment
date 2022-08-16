import '../bindings/nurse_home_binding.dart';
import '../ui/pages/nurse_home_page/nurse_home_page.dart';
      import '../bindings/nurse_signin_binding.dart';
import '../ui/pages/nurse_signin_page/nurse_signin_page.dart';
      import '../bindings/admin_vaccination_centers_binding.dart';
import '../ui/pages/admin_vaccination_centers_page/admin_vaccination_centers_page.dart';
import '../bindings/admin_inventory_binding.dart';
import '../ui/pages/admin_inventory_page/admin_inventory_page.dart';
import '../bindings/admin_view_appointments_binding.dart';
import '../ui/pages/admin_view_appointments_page/admin_view_appointments_page.dart';
import '../bindings/admin_home_binding.dart';
import '../ui/pages/admin_home_page/admin_home_page.dart';
import '../bindings/admin_signin_binding.dart';
import '../ui/pages/admin_signin_page/admin_signin_page.dart';
import '../bindings/generate_certificate_binding.dart';
import '../ui/pages/generate_certificate_page/generate_certificate_page.dart';
import '../bindings/view_apointment_binding.dart';
import '../ui/pages/view_apointment_page/view_apointment_page.dart';
import '../bindings/book_appointment_binding.dart';
import '../ui/pages/book_appointment_page/book_appointment_page.dart';
import '../bindings/get_user_info_binding.dart';
import '../ui/pages/get_user_info_page/get_user_info_page.dart';
import '../bindings/create_new_project_binding.dart';
import '../ui/pages/create_new_project_page/create_new_project_page.dart';
import '../bindings/settings_binding.dart';
import '../ui/pages/settings_page/settings_page.dart';
import '../bindings/introduction_binding.dart';
import '../ui/pages/introduction_page/introduction_page.dart';
import '../bindings/splash_binding.dart';
import '../ui/pages/splash_page/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../bindings/home_binding.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/unknown_route_page/unknown_route_page.dart';
import 'app_routes.dart';

const _defaultTransition = Transition.native;

class AppPages {
  static final unknownRoutePage = GetPage(
    name: AppRoutes.UNKNOWN,
    page: () => UnknownRoutePage(),
    transition: _defaultTransition,
  );

  static final List<GetPage> pages = [
    unknownRoutePage,
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.INTRODUCTION,
      page: () => IntroductionPage(),
      binding: IntroductionBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SETTINGS,
      page: () => SettingsPage(),
      binding: SettingsBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.CREATE_NEW_PROJECT,
      page: () => CreateNewProjectPage(),
      binding: CreateNewProjectBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: AppRoutes.GET_USER_INFO,
      page: () => GetUserInfoPage(),
      binding: GetUserInfoBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.BOOK_APPOINTMENT,
      page: () => BookAppointmentPage(),
      binding: BookAppointmentBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.VIEW_APOINTMENT,
      page: () => ViewApointmentPage(),
      binding: ViewApointmentBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.GENERATE_CERTIFICATE,
      page: () => GenerateCertificatePage(),
      binding: GenerateCertificateBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.ADMIN_SIGNIN,
      page: () => AdminSigninPage(),
      binding: AdminSigninBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.ADMIN_HOME,
      page: () => AdminHomePage(),
      bindings: [
        AdminHomeBinding(),
        AdminViewAppointmentsBinding(),
        AdminInventoryBinding(),
        AdminVaccinationCentersBinding(),
      ],
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.ADMIN_VIEW_APPOINTMENTS,
      page: () => AdminViewAppointmentsPage(),
      binding: AdminViewAppointmentsBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.ADMIN_INVENTORY,
      page: () => AdminInventoryPage(),
      binding: AdminInventoryBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.ADMIN_VACCINATION_CENTERS,
      page: () => AdminVaccinationCentersPage(),
      binding: AdminVaccinationCentersBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.NURSE_SIGNIN,
      page: () => NurseSigninPage(),
      binding: NurseSigninBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.NURSE_HOME,
      page: () => NurseHomePage(),
      binding: NurseHomeBinding(),
      transition: _defaultTransition,
    ), 
];
}