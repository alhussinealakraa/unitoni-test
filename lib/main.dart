import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'app/app.dart';
import 'app/app_module/app_module.dart';
import 'app/controllers/app_base_view_controller.dart';
import 'app/data/datasource/remote_data_source/app_data_source_impl.dart';
import 'app/data/datasource/remote_data_source/app_datasource.dart';
import 'app/data/repositories/app_repository.dart';
import 'app/data/repositories/app_repository_impl.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();



  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  AppModule appModule = Get.put(AppModule(), permanent: true);

  Dio client = Get.put(appModule.dio(appModule.dioOption(),));
  AppDataSource appDataSource = Get.put(
      AppDataSourceImpl( client: client),
      permanent: true);

  AppRepository appRepository = AppRepositoryImpl(appDataSource);

  Get.put(appRepository, permanent: true);

  AppBaseViewController appViewController =
  Get.put(AppBaseViewController(), permanent: true);


    runApp(
         MyApp(baseController: appViewController));

}

