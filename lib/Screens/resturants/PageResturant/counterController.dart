import 'package:get/get.dart';

class CounterController extends GetxController {
  RxBool isOpen=false.obs;
  RxInt itemCount = 1.obs;
  final counter = 1.obs;
  RxBool showBottomSheet = false.obs;

  increment() {
    counter.value++;
    itemCount.value = itemCount.value + counter.value;
  }

  decrement() {
    counter.value--;
     itemCount.value = itemCount.value - counter.value;

  }

  clear() {
    itemCount.value = (counter.value * 0) + 1;
  }
}
