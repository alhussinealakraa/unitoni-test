import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? title;
  final VoidCallback? onPress;
  final Color? color;
  final double? borderRadius;
  final Widget? child;
  final Color? textColor;
  final TextStyle? textStyle;
  final Border? border;
  final bool isLoading;

  const CustomButton(
      {super.key,
      this.width,
      this.height,
      this.title,
      this.onPress,
      this.color,
      this.borderRadius,
      this.child,
      this.isLoading = false,
      this.textColor,
      this.textStyle,
      this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 50.r)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(1, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 50.r)),
        color: color,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 50.r)),
          onTap: onPress,
          child: isLoading
              ? Center(
                child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).scaffoldBackgroundColor)),
              )
              : child ??
                  Center(
                    child: Text(title ?? '',
                        style: textStyle ??
                            Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: textColor)),
                  ),
        ),
      ),
    );
  }
}
