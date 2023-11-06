import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unitoni/features/home/model/news_list_model.dart';

class ListItem extends StatelessWidget {
  const ListItem({required this.item, super.key});
  final ArticleModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86.h,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 1),
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 72.w,
                  height: 72.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(item.urlToImage),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(
                        Radius.elliptical(9999.0, 9999.0)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0, 1),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      item.title,
                      style: context.textTheme.titleLarge,
                    ),
                    Text(
                      DateFormat('dd-MM-yyyy').parse(
                      item.publishedAt).toString(),
                      style: context.textTheme.titleSmall?.copyWith(
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
