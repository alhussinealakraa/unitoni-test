import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../utilities/error/failure.dart';

abstract class UseCase<P, R> {
  const UseCase();

  Future<Either<Failure, R>> call(P params) => doWork(params);

  @protected
  Future<Either<Failure, R>> doWork(P params);
}
