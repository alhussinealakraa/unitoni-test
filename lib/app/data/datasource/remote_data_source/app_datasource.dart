import 'package:dio/dio.dart';
import '../../../../core/data/datasource/unitoni_remote_data_source.dart';


abstract class AppDataSource extends UnitoniRemoteDataSource {
  AppDataSource({
    required Dio client,
  }) : super(client: client);

  // Future<UserInformationModel?> registerUser(
  //     {required RegisterUserParams params});

}
