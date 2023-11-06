import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:unitoni/features/home/view/widgets/first_list_widget.dart';
import 'package:unitoni/features/home/view/widgets/search_fields.dart';
import 'package:unitoni/features/home/view/widgets/second_list_widget.dart';
import 'package:unitoni/features/home/view/widgets/unitoni_app_bar_widget.dart';

import '../view_controller/home_page_view_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  static const String route = '/';

  // static GetPageRoute get pageRoute => GetPageRoute(
  //     page: () => const SplashView(),
  //     binding: BindingsBuilder(
  //           () {
  //         Get.lazyPut(() => SplashViewController());
  //       },
  //     ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UnitoniAppBarWidget(),
              SizedBox(height: 30.h,),
              SearchFieldsWidget(controller: controller),
              SizedBox(height: 30.h,),
              FirstListWidget( controller: controller),
              const Divider(
                color: Colors.black,
              ),
              SecondListWidget( controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
