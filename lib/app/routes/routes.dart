// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

class GetRouter {
  static List<GetPage> getPages = [
    GetPage(
      name: RouteNames.Home,
      page: () => const HomePage(),
      // binding:
    ),
  ];
}

class RouteNames {
  static const String Home = "/";
}
