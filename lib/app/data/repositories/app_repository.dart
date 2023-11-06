import 'package:dartz/dartz.dart';

import '../../../core/data/models/no_params.dart';
import '../../../core/domain/repositories/unitoni_repository.dart';
import '../datasource/remote_data_source/app_datasource.dart';

abstract class AppRepository extends UnitoniRepository<AppDataSource> {
  const AppRepository(AppDataSource appDataSource) : super(appDataSource);

  // Future<Either<Failure, UserInformationModel?>> registerUser(
  //     {required RegisterUserParams params});

}
