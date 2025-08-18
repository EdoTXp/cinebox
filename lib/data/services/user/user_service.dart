import 'package:cinebox/data/models/me_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio) = _UserService;

  @GET('/user/me')
  Future<MeResponse> getMe();
}
