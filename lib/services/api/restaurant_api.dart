import 'package:dio/dio.dart';
import 'package:new88_vaynow/model/base_reponse/base_response.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_api.g.dart';

@RestApi()
abstract class RestaurantApi {
  factory RestaurantApi(Dio dio, {String baseUrl}) = _RestaurantApi;

}
