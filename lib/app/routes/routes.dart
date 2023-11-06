// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../../features/home/view/home_page.dart';

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
