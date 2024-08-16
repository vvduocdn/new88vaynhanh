import 'package:dio/dio.dart';
import 'package:new88_vaynow/model/base_reponse/base_response.dart';
import 'package:new88_vaynow/model/user/authen/info_user_put_body.dart';
import 'package:new88_vaynow/model/user/authen/login_body.dart';
import 'package:new88_vaynow/model/user/authen/login_response.dart';
import 'package:new88_vaynow/model/user/authen/signup_body.dart';
import 'package:retrofit/retrofit.dart';

part 'authen_api.g.dart';

@RestApi()
abstract class AuthServices {
  factory AuthServices(Dio dio, {String baseUrl}) = _AuthServices;

  @POST('/api/auth/login')
  Future<BaseResponse<LoginResponse>> loginAccount(
    @Body() LoginBody body,
  );

  @POST('/api/auth/signup')
  Future<BaseResponse<LoginResponse>> signupAccount(
    @Body() SignupBody body,
  );

  @PUT('/api/users/me')
  Future<BaseResponse<UserResponse>> putUserInfo(@Body() InfoUserPutBody body);
}
