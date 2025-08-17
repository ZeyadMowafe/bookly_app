import 'package:bookly_project/core/utils/api_servive.dart';
import 'package:bookly_project/features/home/data/models/book_model/repos/home_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerSingleton<ApiServive>(ApiServive(Dio()));
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(getIt.get<ApiServive>()));
}
