import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GlobalKey<NavigatorState> navigatorKeyGlobal = GlobalKey();
GlobalKey<ScaffoldMessengerState> scaffoldMessengerGlobal = GlobalKey();
const String BASE_URL =  "https://newsapi.org";



const int kOkCode = 200;
const int kOkOTPCode = 204;
const int kBadReqCode = 400;
const int kNotFoundCode = 404;
const int kIncorrectDataCode = 403;
const int kUnauthorizedCode = 401;
const int kTwoFactorCode = -21;
const int kNeedOtpCode = -22;
final double defaultFormFieldSpace = 20.h;


