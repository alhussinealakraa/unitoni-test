import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/controllers/app_base_view_controller.dart';
import '../model/news_list_model.dart';
import '../usecases/get_news_usecase.dart';

class HomePageController extends GetxController
    with StateMixin<List<ArticleModel>> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  TextEditingController firstSearchController = TextEditingController();
  TextEditingController secondSearchController = TextEditingController();
  AppBaseViewController appBaseViewController = Get.find();
  final GetNewsUseCase getNewsUseCase;

  HomePageController({required this.getNewsUseCase});
  List<ArticleModel> firstNews=[], secondNews=[];


  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  getNewsForFirstList() async {
    (await appBaseViewController.futureWrapper(() => getNewsUseCase(
        firstSearchController.text)))
        .fold((l) => appBaseViewController.handleError(l), (r) {
      firstNews = r?.articles ?? [];
      change(firstNews, status: RxStatus.success());
    });
  }

  getNewsForSecondList() async {
    (await appBaseViewController.futureWrapper(() => getNewsUseCase(
        secondSearchController.text)))
        .fold((l) => appBaseViewController.handleError(l), (r) {
      secondNews = r?.articles ?? [];
      change(secondNews, status: RxStatus.success());
    });
  }
}
