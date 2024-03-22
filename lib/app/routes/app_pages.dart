import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/profile/bindings/edit_profile_binding.dart';
import 'package:tatarupiah/app/modules/profile/views/edit_profile_view.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/chatAi/bindings/chat_ai_binding.dart';
import '../modules/chatAi/views/chat_ai_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/transaction/bindings/transaction_binding.dart';
import '../modules/home/transaction/views/transaction_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/statistics/bindings/statistics_binding.dart';
import '../modules/statistics/views/statistics_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PROFILE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.TRANSACTION,
          page: () => const TransactionView(),
          binding: TransactionBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.STATISTICS,
      page: () => const StatisticsView(),
      binding: StatisticsBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_AI,
      page: () => const ChatAiView(),
      binding: ChatAiBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDITPROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
  ];
}
