

// class AppBaseInteractor
//     extends ResultInteractor<NoParams, AppConfigResponse> {
//   final AppRepositoryImpl _appRepositoryImpl;
//   final BaseLocalDataSourceImpl prefs;
//
//   AppBaseInteractor(this._appRepositoryImpl, this.prefs);
//
//   @override
//   Future<AppConfigResponse> doWork(params) async =>
//       (await _appRepositoryImpl.getApplicationConfiguration()).getOrThrow();
// }
