import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../core/utilities/end_points.dart';
import '../../../../core/utilities/enums.dart';
import '../../../../features/home/model/news_list_model.dart';
import 'app_datasource.dart';

class AppDataSourceImpl extends AppDataSource {

  AppDataSourceImpl({
    required Dio client,
  }) : super(client: client);

  @override
  Future<NewsListModel?> getNews(
      {required String params}) =>
      request(
        method: METHOD.GET,
        endpoint: EndPoints.getNews(params),
        //data: params.toJson(),
        mapper: NewsListModel.fromJson,
        withAuth: false,
      );

}
