import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:system/core/networking/web_services.dart';
import 'package:system/features/bunches_screen/business_logic/bunch_cubit.dart';
import 'package:system/features/companies_screen/business_logic/companies_cubit.dart';
import 'package:system/features/companies_screen/data/repository/companies_repo.dart';
import 'package:system/features/history_operations_screen/business_logic/history_operations_cubit.dart';
import 'package:system/features/history_operations_screen/data/repository/history_operations_repository.dart';
import 'package:system/features/login_screen/business_logic/login_cubit.dart';
import 'package:system/features/login_screen/data/repository/login_repo.dart';
import 'package:system/features/resellers_requests_screen/business_logic/collectors_requests_cubit.dart';
import 'package:system/features/resellers_requests_screen/data/repository/collectors_requests_repository.dart';
import 'package:system/features/review_data_screen/business_logic/review_data_cubit.dart';
import 'package:system/features/review_data_screen/data/repository/review_data_repository.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/data/repository/subscribers_repository.dart';

import '../../features/bunches_screen/data/repository/bunch_repo.dart';
import '../../features/collectors_screen/business_logic/collectors_cubit.dart';
import '../../features/collectors_screen/data/collectors_repo/collectors_repo.dart';
import '../networking/dio_factory/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<WebServices>(() => WebServices(dio));

  // // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));


  getIt.registerLazySingleton<CompaniesCubit>(() => CompaniesCubit(getIt()));
  getIt.registerFactory<CompaniesRepo>(() => CompaniesRepo(getIt()));


  getIt.registerLazySingleton<BunchCubit>(() => BunchCubit(getIt()));
  getIt.registerFactory<BunchRepo>(() => BunchRepo(getIt()));


  getIt.registerLazySingleton<CollectorsCubit>(() => CollectorsCubit(getIt()));
  getIt.registerFactory<CollectorsRepo>(() => CollectorsRepo(getIt()));

  getIt.registerLazySingleton<SubscribersCubit>(() => SubscribersCubit(getIt()));
  getIt.registerFactory<SubscribersRepository>(() => SubscribersRepository(getIt()));

  getIt.registerLazySingleton<CollectorsRequestsCubit>(() => CollectorsRequestsCubit(getIt()));
  getIt.registerFactory<CollectorRequestsRepository>(() => CollectorRequestsRepository(getIt()));

  getIt.registerLazySingleton<ReviewDataCubit>(() => ReviewDataCubit(getIt()));
  getIt.registerFactory<ReviewDataRepository>(() => ReviewDataRepository(getIt()));

  getIt.registerLazySingleton<HistoryOperationsCubit>(() => HistoryOperationsCubit(getIt()));
  getIt.registerFactory<HistoryOperationsRepo>(() => HistoryOperationsRepo(getIt()));

  //  // signup
  // getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  // getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}