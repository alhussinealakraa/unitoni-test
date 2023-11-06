import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';


extension BuildContextExtension on BuildContext {
  //* THEME STUFF *//
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  //* Locale stuff *//
  // AppLocalizations? get locale => AppLocalizations.of(this);
  // String translate(String? key) => locale?.translate(key) ?? key ?? '';

  //* Media query stuff *//
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get fullWidth => mediaQuery.size.width;
  double get fullHeight => mediaQuery.size.height;

  bool get isLtr => true;
}
