import '../../_core_configuration/http_configuration.dart';
import 'base_url_path_constants.dart';

class BaseApiConstants extends BaseUrlPathConstants {
  String get apiBaseUrl => HttpConfiguration.apiBaseUrl;
  String get contentType => "application/json; charset=utf-8";
  int get receiveTimeout => 15000;
  int get connectionTimeout => 15000;

  Uri url(String path) {
    return Uri.parse(apiBaseUrl + path);
  }

  Map<String, String> getTokenHeader(String jwtToken) {
    return {"Content-Type": contentType, "Authorization": "Bearer $jwtToken"};
  }

  Map<String, String> get getTokenlessHeader {
    return {
      "Content-Type": contentType,
    };
  }
}
