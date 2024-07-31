import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vaynow_flutter/services/api/authen_api.dart';
import 'package:vaynow_flutter/services/api/restaurant_api.dart';
import 'package:vaynow_flutter/services/di/locator.dart';
import 'package:vaynow_flutter/services/hive/hive_data_manager.dart';
import 'package:vaynow_flutter/utils/navigator_global_context_helper.dart';

// Sử dụng BearerToken cho xác thực
const authenticatorBearer = 'Bearer';
final StreamController<bool?> streamOpenLogin =
    StreamController<bool?>.broadcast();

class ApiClient {
  bool isOpenLogin = false;
  final dio = Dio();
  final String baseUrl = dotenv.env['API_URL']!;
  final NavigatorGlobalContextHelper navigationService =
      locator.get<NavigatorGlobalContextHelper>();
  late AuthServices authServices;
  late RestaurantApi restaurantApi;

  ApiClient() {
    _initializeDio();
    _initializeApis();
    registerEventStream();
  }

  void _initializeDio() {
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        responseHeader: true,
        requestHeader: true,
        requestBody: true,
        request: true,
      ));
    }

    try {
      // ignore: deprecated_member_use
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return null;
      };
    } catch (_) {}

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await HiveDataManager().getToken();
        if (kDebugMode) {
          log('Authorization $token');
        }

        // Remove null or empty values from query parameters
        options.queryParameters
            .removeWhere((key, value) => value == '' || value == null);

        // Check and log null or empty fields in the request body
        if (options.data is Map) {
          final Map<String, dynamic> body = Map.from(options.data);
          body.removeWhere((key, value) => value == null || value == '');
          log('body: ${body.length}');
          options.data = body;
        }

        if (kDebugMode) {
          log('options: ${options.queryParameters.length}');
        }

        if (token != null) {
          options.headers['Authorization'] = '$authenticatorBearer $token';
        }

        handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == HttpStatus.unauthorized ||
            error.response?.statusCode == HttpStatus.forbidden) {
          streamOpenLogin.sink.add(null);
          return;
        }

        final result = await Connectivity().checkConnectivity();
        if (result.contains(ConnectivityResult.none)){
          const errorMsg =
              "No internet connection. Please check the connection again.";
          if (kDebugMode) {
            print(errorMsg);
          }
          return;
        }

        handler.reject(error);
      },
    ));
  }

  void _initializeApis() {
    authServices = AuthServices(dio, baseUrl: baseUrl);
    restaurantApi = RestaurantApi(dio, baseUrl: baseUrl);
  }

  void registerEventStream() {
    streamOpenLogin.stream.listen((data) {
      if (data == null) {
        if (isOpenLogin) return;
        goToLogin();
      } else {
        isOpenLogin = data;
      }
    });
  }

  void closeStream() {
    streamOpenLogin.close();
  }

  Future<void> goToLogin() async {
  }
}
