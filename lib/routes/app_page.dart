import 'package:get/get.dart';
import 'package:smis_mobile/bindings/splash_binding.dart';
import 'package:smis_mobile/screens/about_us_screen.dart';
import 'package:smis_mobile/screens/academic_record_screen.dart';
import 'package:smis_mobile/screens/attendance_screen.dart';
import 'package:smis_mobile/screens/forgot_password_screen.dart';
import 'package:smis_mobile/screens/my_class_screen.dart';
import 'package:smis_mobile/screens/news_screen.dart';
import 'package:smis_mobile/screens/profile_screen.dart';
import 'package:smis_mobile/screens/reset_password_screen.dart';
import 'package:smis_mobile/screens/school_holidays_screen.dart';
import 'package:smis_mobile/screens/setting_screen.dart';
import 'package:smis_mobile/screens/splash_screen.dart';
import 'package:smis_mobile/screens/login_screen.dart';
import 'package:smis_mobile/screens/home_screen.dart';
import 'package:smis_mobile/screens/verification_code_screen.dart';

part 'app_route.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),

    //workspace screen
    GetPage(name: Routes.HOME_SCREEN, page: () => HomeScreen()),

    //login screen
    GetPage(name: Routes.LOGIN_SCREEN, page: () => LoginScreen()),

    //forgot password screen
    GetPage(
      name: Routes.Forgot_PASSWORD_SCREEN,
      page: () => ForgotPasswordScreen(),
    ),

    //verification code screen
    GetPage(
      name: Routes.VERIFICATION_CONDE_SCREEN,
      page: () => VerificationCodeScreen(),
    ),

    //reset password screen
    GetPage(
      name: Routes.RESET_PASSWORD_SCREEN,
      page: () => ResetPasswordScreen(),
    ),

    //setting screen
    GetPage(name: Routes.SETTING_SCREEN, page: () => SettingScreen()),

    //profile screen
    GetPage(name: Routes.PROFILE_SCREEN, page: () => ProfileScreen()),

    //academic screen
    GetPage(name: Routes.MY_CLASS_SCREEN, page: () => MyClassScreen()),
    GetPage(
      name: Routes.ACADEMIC_RECORD_SCREEN,
      page: () => AcademicRecordScreen(),
    ),
    GetPage(name: Routes.NEWS_SCREEN, page: () => NewsScreen()),
    GetPage(name: Routes.Attendance_SCREEN, page: () => AttendanceScreen()),
    GetPage(
      name: Routes.SCHOOL_HOLIDAY_SCREEN,
      page: () => SchoolHolidaysScreen(),
    ),
    GetPage(name: Routes.ABOUT_US_SCREEN, page: () => AboutUsScreen()),
  ];
}
