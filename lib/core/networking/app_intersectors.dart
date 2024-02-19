import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:system/core/helpers/cache_helper.dart';
import 'package:system/core/routing/routers.dart';
import 'package:system/core/widgets/custom_navigation_bar_widget.dart';

class AppInterceptor extends Interceptor {
  final Dio dio;
  final String token;

  AppInterceptor({required this.dio, required this.token});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    // options.headers[]
    options.headers['Authorization'] = 'Bearer $token';
    print("onRequest method");
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if (err.response?.statusCode == 401) {
      // CacheHelper.removeData(key: 'login').then((value) {
      //   CacheHelper.removeData(key: 'accessToken').then((value) {
      //     CacheHelper.removeData(key: 'unit').then((value) {
      //       remove();
      //       navigateToPage(Routes.loginScreenDesktop);
      //     });
      //   });
      // });

      // CacheHelper.removeData(key: 'login')
      //     .then((value) => CacheHelper.removeData(key: 'accessToken'))
      //     .then((value) {
      //   // Navigator.pushNamedAndRemoveUntil(
      //   //     context, splashScreen, (route) => false);
      // });
    }

    super.onError(err, handler);
  }
}
