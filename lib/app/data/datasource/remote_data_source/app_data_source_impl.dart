import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../core/utilities/end_points.dart';
import '../../../../core/utilities/enums.dart';
import 'app_datasource.dart';

class AppDataSourceImpl extends AppDataSource {

  AppDataSourceImpl({
    required Dio client,
  }) : super(client: client);

  // @override
  // Future<UserInformationModel?> registerUser(
  //         {required RegisterUserParams params}) =>
  //     request(
  //       method: METHOD.POST,
  //       endpoint: EndPoints.registerUser,
  //       data: params.toJson(),
  //       mapper: UserInformationModel.fromJson,
  //       withAuth: prefsRepository.accessToken != null,
  //     );

}
