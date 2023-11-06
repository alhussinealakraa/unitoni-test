import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImagePreviewWidget extends StatelessWidget {
  final String imageUrl;
  final File? pickedImage;

  const ImagePreviewWidget(
      {super.key, required this.imageUrl, this.pickedImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: ClipOval(
            child: Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: InkResponse(
                  radius: 20.w,
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Icon(
                      Icons.close,
                      size: 20.w,
                      color: Colors.black,
                    ),
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: pickedImage != null
                ? Image.file(File(pickedImage!.path))
                : Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  )),
      ],
    );
  }
}
