import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:unitoni/app/theme/unitoni_app_theme.dart';
import 'app_binding.dart';
import 'controllers/app_base_view_controller.dart';
import 'routes/routes.dart';

class MyApp extends GetView<AppBaseViewController> {
  final AppBaseViewController baseController;

  const MyApp({super.key,required this.baseController});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428,926),
        builder: (context,child){
      return OverlaySupport(
        child: GetMaterialApp(
          title: 'Unitoni',
          debugShowCheckedModeBanner: false,
          getPages: GetRouter.getPages,
          initialBinding: AppBinding(),
          initialRoute: RouteNames.Home,
          defaultTransition: Transition.noTransition,
          theme: lightTheme(),
          home: const HomePage(),
        ),
      );
    });
  }
}