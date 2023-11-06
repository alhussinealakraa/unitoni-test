import 'package:dartz/dartz.dart';

import '../../../core/utilities/error/failure.dart';
import '../../../features/home/model/news_list_model.dart';
import '../datasource/remote_data_source/app_datasource.dart';
import 'app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  const AppRepositoryImpl(
    AppDataSource appDataSource,
  ) : super(appDataSource);

  @override
  Future<Either<Failure, NewsListModel?>> getNews(
      {required String params}) async {
    try {
      return Right(await dataSource.getNews(params: params));
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
