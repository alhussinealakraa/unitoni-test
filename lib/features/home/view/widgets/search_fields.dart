import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/view/widgets/custom_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../view_controller/home_page_view_controller.dart';

class SearchFieldsWidget extends StatelessWidget {
  final HomePageController controller;

  const SearchFieldsWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10.w
          ),
          child: Container(
            height: 50.h,

            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0, 1),
                  blurRadius: 1,
                ),
              ],
            ),
            child: CustomTextField(
              didHasEnabledBorder: false,
              didHasFocusedBorder: false,
              didHasBorder: false,
              hasUnderLineBorder: false,
              //textEditingController: controller.searchController,
              hintText: S.of(context).searchForFirstList,
              suffixIcon:
              const Icon(CupertinoIcons.search, color: Colors.black),
              isSuffixIcon: true,
            ),
          ),
        ),
        SizedBox(height: 20.h,),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10.w
          ),
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0, 1),
                  blurRadius: 1,
                ),
              ],
            ),
            child: CustomTextField(
              didHasEnabledBorder: false,
              didHasFocusedBorder: false,
              didHasBorder: false,
              hasUnderLineBorder: false,
              //textEditingController: controller.searchController,
              hintText: S.of(context).searchForSecondList,
              suffixIcon:
              const Icon(CupertinoIcons.search, color: Colors.black),
              isSuffixIcon: true,
            ),
          ),
        ),


      ],
    );
  }
}