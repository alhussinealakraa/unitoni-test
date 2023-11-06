import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../core/utilities/enums.dart';
import '../../core/utilities/error/failure.dart';
import '../../features/no_internet/no_internet_screen.dart';
import '../app_module/app_module.dart';
import '../data/datasource/remote_data_source/app_datasource.dart';
import '../data/models/notification_model.dart';
import '../data/repositories/app_repository.dart';
import '../theme/constants.dart';

class AppBaseViewController extends GetxController {
  AppDataSource appDataSource = Get.find();
  AppModule appModule = Get.find();
  AppRepository appRepository = Get.find();

  final InternetConnectionChecker _connectivity = InternetConnectionChecker();
  late StreamSubscription streamSubscription;

  String? connectionError;
  final isDeviceConnected = true.obs;

  final deviceRegistered = false;
  var connectionType = 0.obs;

  final isLoadingGlobal = false.obs;
  final isShowToggle = true.obs;
  final isButtonEnable = false.obs;

  late NetworkStatusEnums networkStatusEnums;

  Dio client = Get.find();


  @override
  void onInit() {
    super.onInit();
    streamSubscription = _connectivity.onStatusChange.listen(_updateState);
  }

    _updateState(InternetConnectionStatus status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        networkStatusEnums = NetworkStatusEnums.CONNECTED;
        connectionType.value = 1;
        isDeviceConnected.update((val) {
          val = true;
        });
        debugPrint(networkStatusEnums.name);
        break;
      case InternetConnectionStatus.disconnected:
        networkStatusEnums = NetworkStatusEnums.DISCONNECTED;
        connectionType.value = 2;

        debugPrint(networkStatusEnums.name);
        break;
      default:
        connectionType.value = 1;
        debugPrint(status.name);
        break;
    }
  }

  void startLoading({RxBool? isLoading}) {
    if (isLoading != null) {
      isLoading(true);
      update([isLoading]);
    }
    isLoadingGlobal(true);
    isShowToggle(true);
    update();
  }

  void stopLoading({RxBool? isLoading}) {
    if (isLoading != null) {
      isLoading(false);
      update([isLoading]);
    }
    isLoadingGlobal(false);
    isShowToggle(false);
    update();
  }
  void onPressedTryAgain() async {
    if (networkStatusEnums == NetworkStatusEnums.DISCONNECTED) {
      isDeviceConnected.update((val) {
        val = false;
      });
      return;
    } else {
      isDeviceConnected.update((val) {
        val = true;
      });
      Get.back();
    }
  }
  void toggle() {
    var alert = AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryTintColor),
          ),
          SizedBox(width: 10.w),
          Text(
            'loading...',
            style: Theme.of(Get.context!).textTheme.bodyText1,
          ),
        ],
      ),
    );
    if (isShowToggle.value) {
      Get.dialog(
        WillPopScope(onWillPop: () async => false, child: alert),
        barrierDismissible: false,
      );
      return;
    } else {
      Navigator.of(Get.overlayContext!).pop();
    }
  }

  Future<Either<Failure, T>> futureWrapper<T>(
    Future<Either<Failure, T>> Function() block, {
    bool useLoader = true,
    RxBool? loadingValue,
    bool showToggle = false,
    VoidCallback? onEveryError,
  }) {
    connectionError = null;
    if (useLoader) {
      loadingValue ??= RxBool(true);
      startLoading(isLoading: loadingValue);
      if (showToggle) {
        toggle();
      }
    }
    return Future(() => block().whenComplete(() {
          if (useLoader) {
            loadingValue ??= RxBool(false);
            stopLoading(isLoading: loadingValue);
            if (showToggle) {
              toggle();
            }
          }
        }));
  }

  void handleError(Failure failure,
      {void Function(Failure failure)? exceptionHandler}) {
    if (exceptionHandler != null) {
      exceptionHandler.call(failure);
    }
    if (failure is NetworkFailure) {
      Get.to(() => const NoInternetScreen());
    }
    if (failure is ServerFailure) {
      Get.showSnackbar(GetSnackBar(
        message: failure.message,
        duration: const Duration(milliseconds: 2000),
      ));
    } else {
      showToastMessage(failure.message);
    }
  }

  showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Get.context?.theme.colorScheme.primary,
      textColor: Get.context?.theme.colorScheme.onBackground,
      fontSize: 16.0,
    );
  }

  void unknownErrorHandler(dynamic cause) {
    Fluttertoast.showToast(
      msg: cause,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Get.context?.theme.colorScheme.primary,
      textColor: Get.context?.theme.colorScheme.onBackground,
      fontSize: 16.0,
    );
  }
}
