import 'package:dartz/dartz.dart';

import '../../../core/utilities/error/failure.dart';
import '../datasource/remote_data_source/app_datasource.dart';
import 'app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  const AppRepositoryImpl(
    AppDataSource appDataSource,
  ) : super(appDataSource);

  // @override
  // Future<Either<Failure, UserInformationModel?>> registerUser(
  //     {required RegisterUserParams params}) async {
  //   try {
  //     return Right(await dataSource.registerUser(params: params));
  //   } on Failure catch (e) {
  //     return Left(e);
  //   }
  // }
}
