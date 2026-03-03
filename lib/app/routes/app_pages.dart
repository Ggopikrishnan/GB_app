import 'package:gb_app/main.dart';
import 'package:gb_app/modules/auth/login/views/login_view.dart';
import 'package:gb_app/modules/auth/name/bindings/name_binding.dart';
import 'package:gb_app/modules/auth/name/views/name_view.dart';
import 'package:gb_app/modules/auth/otp/bindings/otp_binding.dart'
    show OtpBinding;
import 'package:gb_app/modules/auth/otp/views/otp_view.dart';
import 'package:gb_app/modules/auth/success/bindings/success_binding.dart';
import 'package:gb_app/modules/auth/success/views/success_view.dart';
import 'package:gb_app/modules/games/cricket/bindings/cricket_binding.dart' show CricketBinding;
import 'package:gb_app/modules/games/rummy/view/rummy_view.dart' show RummyView;
import 'package:gb_app/modules/home/binding/home_binding.dart';
import 'package:gb_app/modules/home/view/home_view.dart';
import 'package:gb_app/modules/splash/bindings/splash_binding.dart';
import 'package:gb_app/modules/splash/view/splash_view.dart';
import 'package:get/get.dart';
import '../../modules/auth/login/bindings/login_binding.dart' show LoginBinding;
import '../../modules/games/chess/bindings/chess_binding.dart';
import '../../modules/games/chess/view/chess_view.dart';
import '../../modules/games/cricket/view/cricket_view.dart';
import '../../modules/games/rummy/bindings/rummy_binding.dart';
import '../../modules/onboarding/binding/onboradingbinding.dart';
import '../../modules/onboarding/view/onboarding_view.dart';

class AppPages {
  static const initial = '/splash';

  static final routes = [
    GetPage(
  name: '/splash',
  page: () => const SplashView(),
  binding: SplashBinding(), 
),

    GetPage(name: '/', page: () => AuthCheck()),
    GetPage(
      name: '/onboarding',
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(name: '/otp', page: () => const OtpView(), binding: OtpBinding()),
    GetPage(
      name: '/name',
      page: () => const NameView(),
      binding: NameBinding(),
    ),
    GetPage(
      name: '/success',
      page: () => const SuccessView(),
      binding: SuccessBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/cricket',
      page: () => const CricketView(),
      binding: CricketBinding(),
    ),
    GetPage(
      name: '/rummy',
      page: () => const RummyView(),
      binding: RummyBinding(),
    ),
    GetPage(
      name: '/games',
      page: () => const GamesScreen(),
      binding: GamesBinding(),
    ),
  ];
}
