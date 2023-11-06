import 'package:dio/dio.dart';
import '../../../../core/data/datasource/unitoni_remote_data_source.dart';
import '../../../../features/home/model/news_list_model.dart';


abstract class AppDataSource extends UnitoniRemoteDataSource {
  AppDataSource({
    required Dio client,
  }) : super(client: client);

  Future<NewsListModel?> getNews(
      {required String params});

}
