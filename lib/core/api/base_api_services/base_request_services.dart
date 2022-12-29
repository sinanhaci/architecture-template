
// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'package:dio/dio.dart';
import '../../_core_configuration/http_configuration.dart';
import 'base_api_constants.dart';
import 'base_response_handle.dart';

class BaseRequestMethod extends BaseResponseHandle {
  BaseApiConstants constants = BaseApiConstants();
  static late Dio client;
  dioInitialize(){
    client = Dio()
    ..options.baseUrl = constants.apiBaseUrl
    ..options.connectTimeout = constants.connectionTimeout
    ..options.receiveTimeout = constants.receiveTimeout
    ..options.contentType = constants.contentType
    ..options.headers = constants.getTokenHeader(HttpConfiguration.token ?? 'TOKEN')
    ..options.responseType = ResponseType.json;
  }

  Future<T> _getMethod<T>(String path,bool authorization, Function(dynamic response) returnedResponse) async {
    return await responseHandle<T>(
      request: () async => await client.get(path,)
      .timeout(const Duration(seconds: 15),onTimeout: ()=>returnedResponse(timeOutResponse)),
      response: (response) => returnedResponse(response));
  }

  Future _postMethod<T>(String path, Map<String, dynamic>? data, bool authorization,Function(dynamic response) returnedResponse,String? token) async {
    return await responseHandle(
      request: () async => await client.post(path,data: data,options:!authorization ? Options(headers: constants.getTokenlessHeader) : null),
      response: (response) {
        return returnedResponse(response);
      },
    );
  }

  Future<T> _putMethod<T>(String path, Map<String, dynamic>? data, bool authorization,Function(dynamic response) returnedResponse) async {
    return await responseHandle<T>(
      request: () async => await client.put(path,data: data,options:!authorization ? Options(headers: constants.getTokenlessHeader) : null),
      response: (response){
        returnedResponse(response);
      },
    );
  }

  Future<T> _deleteMethod<T>(String path, Map<String, dynamic>? data, bool authorization,Function(dynamic response) returnedResponse) async {
    return await responseHandle<T>(
      request: () async => await client.delete(path,data: data,options:!authorization ? Options(headers: constants.getTokenlessHeader) : null),
      response: (response) => returnedResponse(response),
    );
  }
  

  Future<T> baseHttpRequest<T>({HttpRequestType requestType = HttpRequestType.POST,required String path,Map<String, dynamic>? body,bool authorization = true,String? token,required Function(dynamic response) response}) async {
    switch (requestType) {
      case HttpRequestType.GET:
        return await _getMethod<T>(path, authorization, response);
      case HttpRequestType.POST:
        return await _postMethod<T>(path, body, authorization,response,token);
      case HttpRequestType.PUT:
        return await _putMethod(path, body, authorization,response);
      case HttpRequestType.DELETE:
        return await _deleteMethod(path, body, authorization,response);
    }
  }

  // Future<BaseResponseModel<UserModel>> refreshTokenMethod() async {
  //   return await baseHttpRequest<BaseResponseModel<UserModel>>(
  //     authorization: true,
  //     path: refreshTokenPath,
  //     body: {"RefreshToken":UserModel.user?.refreshToken},
  //     response: (response) async{
  //       var responseModel = BaseResponseModel<UserModel>.fromJson(
  //         json: response,
  //         decodeFunction: (decodeFunction) {
  //           return UserModel.fromJson(decodeFunction);
  //         },);
  //       if(responseModel.result == 1){
  //         SmsVerificationController controller = SmsVerificationController();
  //         await controller.writeUserInfoWithCache(responseModel.data!);
  //         client.options.headers = constants.getTokenHeader(UserModel.user?.token ?? '');
  //       }else{
  //         await LocalCache.clear();
  //         NavigationService.instance.navigateToPageClear(path: NavigationConstants.DEFAULT);
  //       }
  //       return responseModel;
  //     },
  //   );
  // }

}



enum HttpRequestType {
  GET,
  POST,
  PUT,
  DELETE,
}
