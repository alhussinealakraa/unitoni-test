import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../generated/l10n.dart';
import '../../view_controller/home_page_view_controller.dart';
import 'list_item.dart';

class SecondListWidget extends StatelessWidget {
  final HomePageController controller;
  const SecondListWidget({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(S.of(context).secondList)
          ],
        ),


        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: controller.obx(
                  (state) =>
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.secondNews.length,
                    itemBuilder: (context, index) {
                      return ListItem(
                        item: controller.secondNews[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 25.h,
                      );
                    },
                  ),
              onLoading: const CircularProgressIndicator(
                color: Colors.blue,
              )
          )
        ),

      ],
    );
  }
}
