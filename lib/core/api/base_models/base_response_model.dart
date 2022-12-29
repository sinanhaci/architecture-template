class BaseResponseModel<T> {
  int result;
  String? err;
  T? data;

  BaseResponseModel(
      {required this.data, required this.result, required this.err});

  factory BaseResponseModel.fromJson(
      {required Map<String, dynamic>? json,
      required Function(Map<String, dynamic> decode) decodeFunction}) {
    return BaseResponseModel<T>(
        data: json?['data'] == null ? null : decodeFunction(json?['data']),
        result: json?['result'],
        err: json?['err']);
  }
}
