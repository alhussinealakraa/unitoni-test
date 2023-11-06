
import 'package:get/get.dart';
import 'package:unitoni/features/home/usecases/get_news_usecase.dart';

import '../features/home/view_controller/home_page_view_controller.dart';
import 'controllers/app_base_view_controller.dart';


class AppBinding extends Bindings {
  AppBaseViewController appBaseViewController = Get.find();


  @override
  void dependencies() {
    GetNewsUseCase getNewsUseCase = GetNewsUseCase(
        appBaseViewController.appRepository);
    Get.lazyPut(() => HomePageController(getNewsUseCase:getNewsUseCase));
  }
}