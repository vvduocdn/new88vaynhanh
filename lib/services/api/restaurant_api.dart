import 'package:dio/dio.dart';
import 'package:new88_vaynow/model/base_reponse/base_response.dart';
import 'package:new88_vaynow/model/home/banner_model.dart';
import 'package:new88_vaynow/model/home/cart_body.dart';
import 'package:new88_vaynow/model/home/cart_model.dart';
import 'package:new88_vaynow/model/home/history_order_model.dart';
import 'package:new88_vaynow/model/home/menu_restaurant_model.dart';
import 'package:new88_vaynow/model/home/notification_model.dart';
import 'package:new88_vaynow/model/home/order_address_body.dart';
import 'package:new88_vaynow/model/home/order_address_model.dart';
import 'package:new88_vaynow/model/home/order_body.dart';
import 'package:new88_vaynow/model/home/product_delete_model.dart';
import 'package:new88_vaynow/model/home/product_model.dart';
import 'package:new88_vaynow/model/home/restaurant_model.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_api.g.dart';

@RestApi()
abstract class RestaurantApi {
  factory RestaurantApi(Dio dio, {String baseUrl}) = _RestaurantApi;

  @GET('/api/restaurant')
  Future<BaseResponse<RestaurantModelResponse>> getAllRestaurant(
    @Query("limit") int limit,
    @Query("page") int? page,
    @Query("sort_by") String? sort,
    @Query("query") String query,
  );

  @GET('/api/restaurant-menu')
  Future<BaseResponse<List<MenuRestaurantModel>>> getMenuRestaurant(
    @Query("restaurant_id") String restaurantId,
  );

  @GET('/api/product')
  Future<BaseResponse<ProductModelResponse>> fetchProductsRestaurant(
    @Query("limit") int limit,
    @Query("page") int? page,
    @Query("restaurant_id") String? restaurantId,
    @Query("menu_id") String? menuId,
  );

  @PUT('/api/mobile/cart')
  Future<BaseResponse<CartModel>> addProductCart(@Body() CartBody body);

  @GET('/api/mobile/cart')
  Future<BaseResponse<CartModel>> fetchCart();

  @DELETE('/api/mobile/cart/delete-item')
  Future<BaseResponse<CartModel>> deleteProductCart(
      @Body() ProductDeleteModel body);

  @POST('/api/order/private')
  Future<BaseResponse<dynamic>> postOrder(@Body() OrderBody body);

  @PUT('/api/mobile/cart/clear')
  Future<BaseResponse<CartModel>> clearCartOrder();

  @GET('/api/order/private')
  Future<BaseResponse<HistoryOrderAddressResponse>> fetchHistoryOrder(
    @Query("limit") int limit,
    @Query("page") int? page,
    @Query("sort_direction") String? sort,
    @Query("status") String status,
  );

  @GET('/api/order/{id}')
  Future<BaseResponse<HistoryOrderModel>> getDetailOrder(@Path("id") String id);

  @GET('/api/ads/all')
  Future<BaseResponse<List<BannerModel>?>> getADS();

  @GET('/api/address/all')
  Future<BaseResponse<List<OrderAddressModel>?>> getAddressOrder();

  @POST('/api/address')
  Future<BaseResponse<OrderAddressModel>> postAddressOrder(
      @Body() OrderAddressBody body);

  @PATCH('/api/address/{id}')
  Future<BaseResponse<OrderAddressModel>> patchAddressOrder(
      @Path("id") String id, @Body() OrderAddressBody body);

  @GET('/api/notification')
  Future<BaseResponse<NotificationResponse>> getNotification(
    @Query("limit") int limit,
    @Query("page") int? page,
  );

  @DELETE('/api/address/{id}')
  Future<BaseResponse<dynamic>> deleteOrderAddress(@Path("id") String id);

  @GET('/api/product/{id}')
  Future<BaseResponse<ProductModel>> getDetailProduct(@Path("id") String id);
}
