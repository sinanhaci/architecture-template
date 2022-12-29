import '../api/base_api_services/base_request_services.dart';
import '../api/base_models/base_response_model.dart';


class HttpConfiguration extends BaseRequestMethod{
  static const String apiBaseUrl = 'https://sinanhaci.com/api/';
  static String? token;


  Future<BaseResponseModel> refreshToken() async {
    return await baseHttpRequest<BaseResponseModel>(
      authorization: true,
      path: refreshTokenPath,
      response: (response) async{
        return response;
      },
    );
  }
}