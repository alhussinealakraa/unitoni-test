import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


ThemeData _buildServiceProviderLightTheme(ThemeData base) {
  return base.copyWith(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.normal),
      actionsIconTheme: const IconThemeData(
        color: Color(0xFF2786B4),
      ),
      backgroundColor: const Color(0xFFF9F9F9),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 20.w,
      ),
    ),
    backgroundColor: const Color(0xFFF9F9F9),
    primaryColor: const Color(0xFF2786B4),
    canvasColor: Colors.white,
    errorColor: const Color(0xFFC1292E),
    disabledColor: const Color(0xffA3A3A3),
    hintColor: const Color(0xFF929292),
    // hintColor: Colors.black,
    colorScheme: ColorScheme.fromSwatch(
      errorColor: Colors.red,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 20.w,
    ),
    cardColor: Colors.white,
    buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.normal),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: Colors.black,
            fontSize: 30.sp,
            fontWeight: FontWeight.bold),
        headline2: TextStyle(
            color: Colors.black,
            fontSize: 27.sp,
            fontWeight: FontWeight.bold),
        headline3: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold),
        headline4: TextStyle(
            color: Colors.black,
            fontSize: 21.sp,
            fontWeight: FontWeight.bold),
        headline5: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500),
        headline6: TextStyle(
            color: Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500),
        button: TextStyle(
            color: Colors.white,
            fontSize: 23.sp,
            fontWeight: FontWeight.w400),
        bodyText1: TextStyle(
            color: Colors.black,
            fontSize: 17.sp,
            fontWeight: FontWeight.w400),
        bodyText2: TextStyle(
            color: Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400),
        //paragraph
        subtitle1: TextStyle(
          color: Colors.black,
          fontSize: 19.sp,
          fontWeight: FontWeight.bold,
        ),
        subtitle2: TextStyle(
            color: Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold),
        overline: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400),
        caption: TextStyle(
            color: Colors.black,
            fontSize: 11.sp,
            fontWeight: FontWeight.w400)
    )
        .apply(fontFamily: "Roboto"),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: const Color(0xFF3289CA).withOpacity(0.4),
      selectionHandleColor: const Color(0xFF3289CA),
      cursorColor: const Color(0xFF3289CA),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return const Color(0xFF3289CA).withOpacity(0.1);
              } else {
                return const Color(0xFF3289CA);
              }
            }),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r))),
            minimumSize:
            MaterialStateProperty.all(Size(double.infinity, 48.h)))),
    // scaffoldBackgroundColor: Colors.white,
    dividerColor: const Color(0xfff1f1f1),
    cardTheme: const CardTheme(color: Colors.white),
  );
}

ThemeData lightTheme() => _buildServiceProviderLightTheme(ThemeData.light());
