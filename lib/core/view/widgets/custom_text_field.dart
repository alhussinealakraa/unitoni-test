import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/theme/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.isRequired = false,
    this.fieldStateKey,
    this.useObscure = false,
    this.autoFocus = false,
    this.readOnly = false,
    this.canSubmit = true,
    this.hintText,
    this.onChanged,
    this.isSuffixIcon,
    this.suffixIcon,
    this.initialValue,
    this.textEditingController,
    this.onTab,
    this.keyboardType,
    this.focusNode,
    this.validator,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.nextFocusNode,
    this.autovalidateMode,
    this.labelText,
    this.hasUnderLineBorder = true,
    this.enabled,
    this.textAlign = TextAlign.start,
    this.labelTextStyle,
    this.prefixIcon,
    this.didHasEnabledBorder = false,
    this.didHasFocusedBorder = false,
    this.didHasBorder = false,
    this.focusedBorderColor,
    this.enabledBorderRadius,
    this.width,
    this.height,
    this.cardBorderColor,
    this.hintTextStyle,
    this.onClick,
    this.maxLines = 1,
    this.textInputAction,
    this.minLines = 1,
    this.textAlignVertical,
    this.textCapitalization,
    this.textFieldMaxLength,
    this.disabledBorderColor,
    this.onTapSuffixIcon,
  }) : super(key: key);

  final GlobalKey<FormFieldState<String>>? fieldStateKey;

  final VoidCallback? onTapSuffixIcon;
  final int? textFieldMaxLength;
  final TextCapitalization? textCapitalization;
  final bool didHasEnabledBorder;
  final bool didHasFocusedBorder;
  final bool didHasBorder;
  final Color? focusedBorderColor;
  final Color? disabledBorderColor;
  final double? enabledBorderRadius;
  final TextAlign textAlign;
  final bool isRequired;
  final String? hintText;
  final bool useObscure;
  final bool? isSuffixIcon;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final String? initialValue;
  final Function? onTab;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final bool canSubmit;
  final AutovalidateMode? autovalidateMode;
  final bool autoFocus;
  final String? labelText;
  final bool hasUnderLineBorder;
  final bool? enabled;
  final TextStyle? labelTextStyle;
  final TextStyle? hintTextStyle;
  final double? width;
  final double? height;
  final Color? cardBorderColor;
  final VoidCallback? onClick;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  final TextAlignVertical? textAlignVertical;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        textAlign: textAlign,
        key: fieldStateKey,
        style: Theme.of(context).textTheme.headline1!.merge(
            TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, height: 1)),
        keyboardType: keyboardType ?? TextInputType.text,
        focusNode: focusNode,
        onTap: onTab as void Function()?,
        autofocus: autoFocus,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: textFieldMaxLength,
        maxLengthEnforcement: textFieldMaxLength == 12
            ? MaxLengthEnforcement.enforced
            : MaxLengthEnforcement.none,
        textAlignVertical: textAlignVertical,
        obscureText: useObscure,
        validator: validator,
        autovalidateMode: autovalidateMode,
        onChanged: onChanged,
        enabled: enabled,
        initialValue: initialValue,
        controller: textEditingController,
        textInputAction: nextFocusNode == null
            ? textInputAction ?? TextInputAction.done
            : TextInputAction.next,
        onFieldSubmitted: (text) {
          if (nextFocusNode != null) {
            nextFocusNode!.requestFocus();
            fieldStateKey?.currentState?.validate();
          } else if (canSubmit) {
            onFieldSubmitted?.call(text);
          }
        },
        readOnly: readOnly,
        inputFormatters: keyboardType == TextInputType.number
            ? [FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
            : inputFormatters,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelTextStyle ??
              Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: 14.sp,
                  ),
          errorMaxLines: 3,
          hintText: hintText,
          hintStyle: hintTextStyle ??
              Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: 16.sp,
                  ),
          counterText: '',
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(enabledBorderRadius != null
                  ? Radius.circular(enabledBorderRadius!)
                  : fieldRadius),
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          border: didHasBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.all(enabledBorderRadius != null
                      ? Radius.circular(enabledBorderRadius!)
                      : fieldRadius),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor))
              : didHasBorder
                  ? null
                  : InputBorder.none,
          enabledBorder: didHasEnabledBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.all(enabledBorderRadius != null
                      ? Radius.circular(enabledBorderRadius!)
                      : fieldRadius),
                  borderSide: BorderSide(
                      color: disabledBorderColor ??
                          Theme.of(context).primaryColor),
                )
              : null,
          focusedBorder: didHasFocusedBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.all(enabledBorderRadius != null
                      ? Radius.circular(enabledBorderRadius!)
                      : fieldRadius),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                )
              : null,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(enabledBorderRadius != null
                  ? Radius.circular(enabledBorderRadius!)
                  : fieldRadius),
              borderSide: BorderSide(color: Theme.of(context).errorColor)),
          suffixIconConstraints: BoxConstraints(maxHeight: 25.h),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(enabledBorderRadius != null
                ? Radius.circular(enabledBorderRadius!)
                : fieldRadius),
            borderSide:
                BorderSide(width: 1.0, color: Theme.of(context).errorColor),
          ),
          errorStyle: TextStyle(fontSize: 10.sp, height: 0.9),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          prefixIcon: prefixIcon,
          alignLabelWithHint: true,
          suffixIcon: isSuffixIcon == true
              ? Padding(
                padding: EdgeInsetsDirectional.only(start: 8.w, end: 8.w),
                child: GestureDetector(
                    onTap: onTapSuffixIcon,
                    child: suffixIcon),
              )
              : null,
        ),
      ),
    );
  }
}
