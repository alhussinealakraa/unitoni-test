
import 'package:get/get.dart';

import '../features/splash/view_controller/splash_view_controller.dart';

class AppBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SplashViewController());
  }
}