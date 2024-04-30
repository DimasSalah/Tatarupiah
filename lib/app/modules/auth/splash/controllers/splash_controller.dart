import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

class SplashController extends GetxController {
  RxString token = ''.obs;

  @override
  void onReady() {
    checkLogin();
  }

  // void checkLogin() async {
  //   final getToken = await GetStorage().read('token');
  //   token.value = getToken;
  //   print(token.value);
  //   Future.delayed(Duration(seconds: 3), () {
  //     Get.offNamed(Routes.ONBOARDING);
  //   });
  // }
  void checkLogin() async {
    final getToken = await GetStorage().read('token');
    final isOnBoardingCompleted =
        await GetStorage().read('isOnBoardingCompleted');
    Future.delayed(Duration(seconds: 3), () {
      if (getToken == "" && isOnBoardingCompleted != true ||
          getToken == null && isOnBoardingCompleted != true) {
        Get.offNamed(Routes.ONBOARDING);
      } else if (getToken == "" && isOnBoardingCompleted == true ||
          getToken == null && isOnBoardingCompleted == true) {
        Get.offNamed(Routes.AUTH);
      } else {
        token.value = getToken;

        Get.offNamed(Routes.HOME);
      }
    });
  }
}
