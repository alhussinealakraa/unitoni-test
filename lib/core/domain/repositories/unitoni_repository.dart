import 'package:flutter/foundation.dart';

import '../../data/datasource/unitoni_remote_data_source.dart';


abstract class UnitoniRepository<T extends UnitoniRemoteDataSource> {
  const UnitoniRepository(this.dataSource);

  @protected
  final T dataSource;
}
