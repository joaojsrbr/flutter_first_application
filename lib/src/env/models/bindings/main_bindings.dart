import 'package:get/get.dart';
import 'package:void_01/theme/theme_provider.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
  }
}
