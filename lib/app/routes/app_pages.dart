import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/auth/splash/bindings/splash_binding.dart';
import '../modules/auth/splash/views/splash_view.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/chatAi/assistant/bindings/assistant_binding.dart';
import '../modules/chatAi/assistant/views/assistant_view.dart';
import '../modules/chatAi/bindings/chat_ai_binding.dart';
import '../modules/chatAi/recomendation/bindings/recomendation_binding.dart';
import '../modules/chatAi/recomendation/views/recomendation_view.dart';
import '../modules/chatAi/views/chat_ai_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/category/bindings/category_binding.dart';
import '../modules/home/category/views/add_category_view.dart';
import '../modules/home/category/views/add_category_view.dart';
import '../modules/home/category/views/category_view.dart';
import '../modules/home/history/bindings/history_binding.dart';
import '../modules/home/history/views/history_view.dart';
import '../modules/home/transaction/bindings/transaction_binding.dart';
import '../modules/home/transaction/views/transaction_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/edit_profile_view.dart';
import '../modules/profile/views/password_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/statistics/bindings/statistics_binding.dart';
import '../modules/statistics/views/statistics_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

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
        GetPage(
          name: _Paths.HISTORY,
          page: () => const HistoryView(),
          binding: HistoryBinding(),
        ),
        GetPage(
          name: _Paths.CATEGORY,
          page: () => const CategoryView(),
          binding: CategoryBinding(),
        ),
        GetPage(
            name: _Paths.ADDCATEGORY,
            page: () => const AddCategory(),
            binding: CategoryBinding())
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
      children: [
        GetPage(
          name: _Paths.REGISTER,
          page: () => const RegisterView(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: _Paths.SPLASH,
          page: () => const SplashView(),
          binding: SplashBinding(),
        ),
      ],
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
      children: [
        GetPage(
          name: _Paths.RECOMENDATION,
          page: () => const RecomendationView(),
          binding: RecomendationBinding(),
        ),
        GetPage(
          name: _Paths.ASSISTANT,
          page: () => const AssistantView(),
          binding: AssistantBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
        name: _Paths.PROFILE,
        page: () => ProfileView(),
        binding: ProfileBinding(),
        children: [
          GetPage(
            name: _Paths.EDITPROFILE,
            page: () => const EditProfileView(),
            binding: ProfileBinding(),
          ),
          GetPage(
            name: _Paths.CHANGE_PASSWORD,
            page: () => const ChangePasswordView(),
            binding: ProfileBinding(),
          ),
        ]),
  ];
}
