import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:system/core/helpers/cache_helper.dart';
import 'package:system/core/networking/api_intersectors/app_intersectors.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 100);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = Duration(seconds: 400)
        ..options.receiveTimeout = Duration(seconds: 400);
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() async {
    dio?.interceptors.add(AppInterceptor(dio: dio??Dio(),token: await CacheHelper.getdata(key: 'token')??""));
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: false,
        responseBody: false,
      ),
    );
  }
}