
import 'package:get/get.dart';

mixin CashierMixin on GetxController {
  RxInt orderValue = 0.obs;

   void incrementOrder() {
    orderValue.value++;
  }

  void decrementOrder() {
    if (orderValue.value > 0) {
      orderValue.value--;
    }
  }
}