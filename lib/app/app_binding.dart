
import 'package:get/get.dart';

import '../features/home/view_controller/home_page_view_controller.dart';


class AppBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}