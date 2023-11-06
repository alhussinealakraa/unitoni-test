import 'package:dartz/dartz.dart';
import 'package:unitoni/features/home/model/news_list_model.dart';

import '../../../core/data/models/no_params.dart';
import '../../../core/domain/repositories/unitoni_repository.dart';
import '../../../core/utilities/error/failure.dart';
import '../datasource/remote_data_source/app_datasource.dart';

abstract class AppRepository extends UnitoniRepository<AppDataSource> {
  const AppRepository(AppDataSource appDataSource) : super(appDataSource);

  Future<Either<Failure, NewsListModel?>> getNews(
      {required String params});

}
