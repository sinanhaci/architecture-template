import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../_core_configuration/http_configuration.dart';
import '../../localization/localization_controller.dart';
import '../base_models/base_response_list_model.dart';
import 'base_url_path_constants.dart';

class BaseResponseHandle extends BaseUrlPathConstants {
  Future<dynamic> responseHandle<T>({
    required Future<Response>? Function() request,
    required Function(dynamic response) response,
  }) async {
    Response? responseAPI;
    try {
      responseAPI = await request();
      if (responseAPI != null) {
        switch (responseAPI.statusCode) {
          case 200:
            if (responseAPI.data['err'] != null) {
              return response(_apiError(responseAPI.data));
            } else {
              return await response(responseAPI.data);
            }
          default:
            return response(_errorRequest(responseAPI));
        }
      } else {
        return response(_otherException());
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode == 401) {
        await HttpConfiguration().refreshToken();
        return await responseHandle(request: request, response: response);
      }
      return response(_errorRequest(responseAPI));
    } on SocketException {
      return response(_networkException(responseAPI));
    } catch (exception) {
      return response(_errorRequest(responseAPI));
    } finally {
      if (kDebugMode) {
        print('Http Status Code: ${responseAPI?.statusCode}');
        print(
            'Http Request Url: ${responseAPI?.requestOptions.baseUrl}${responseAPI?.requestOptions.path}');
        print('Http Response Body: ${responseAPI?.data}');
      }
    }
  }

  errorResponseModel<T>({required String errorText, int? statusCode}) {
    return errorBaseListModel(
      BaseResponseListModel(
        data: null,
        result: statusCode ?? -0000000,
        err: errorText,
      ),
    );
  }

  dynamic errorBaseListModel(BaseResponseListModel data) {
    var convert = json.encode(data.toJson());
    return jsonDecode(convert);
  }

  _networkException(Response? response) {
    return errorResponseModel(
        errorText: tr.httpErrorNoNetwork, statusCode: response?.statusCode);
  }

  _otherException() {
    var returned = errorResponseModel(
      errorText: tr.httpErrorOther,
    );
    return returned;
  }

  _apiError(dynamic data) {
    return errorResponseModel(
      errorText: data['err'],
      statusCode: data['result'],
    );
  }

  _errorRequest(Response? response) {
    return errorResponseModel(
      errorText:
          tr.httpErrorStatusCode(response?.statusCode.toString() ?? '404'),
    );
  }

  dynamic timeOutResponse<T>() {
    return errorResponseModel(errorText: tr.httpErrorTimeOut);
  }


 
}
