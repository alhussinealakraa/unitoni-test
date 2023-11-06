import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../app/app_icons.dart';
import '../../app/controllers/app_base_view_controller.dart';
import '../../core/utilities/enums.dart';
import '../../core/view/widgets/custom_button.dart';
import '../../generated/l10n.dart';


class NoInternetScreen extends GetView<AppBaseViewController> {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
          child: WillPopScope(
            onWillPop: () {
              if (controller.networkStatusEnums == NetworkStatusEnums.DISCONNECTED) {
                return Future.value(false);
              }else{
                return Future.value(true);
              }
            },
            child: Scaffold(
              body: SizedBox(
                height: double.infinity,
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Flexible(
                      flex: 1,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 15.h),
                          child: Text(
                            S.of(context).noInternet,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontWeight: FontWeight.w500)),
                        ),
                      )),
                  SizedBox(
                    height: 50.h,
                  ),
                  const Spacer(),
                  Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
                        child: Center(
                          child: CustomButton(
                            color: Theme.of(context).primaryColor,
                            height: 52.h,
                            width: 253.w,
                            title: S.of(context).tryAgain,
                            onPress: () {
                              controller.onPressedTryAgain();
                            },
                          ),
                        ),
                      )),
                ]),
              ),
            ),
          )),
    );
  }
}
