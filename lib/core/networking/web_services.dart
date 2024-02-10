import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:system/core/networking/api_constants.dart';

part 'web_services.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class WebServices{
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  // @GET(ApiConstants.login)
  // Future<String> login();

}