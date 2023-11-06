import 'package:dartz/dartz.dart';

import '../../../../app/data/repositories/app_repository.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/utilities/error/failure.dart';
import '../model/news_list_model.dart';

class GetNewsUseCase
    extends UseCase<String, NewsListModel?> {
  final AppRepository appRepository;

  GetNewsUseCase(this.appRepository);

  @override
  Future<Either<Failure, NewsListModel?>> doWork(
      String params) async {
    return await appRepository.getNews(params: params);
  }
}
