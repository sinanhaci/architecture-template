class BaseResponseListModel<T> {
  int result;
  String? err;
  List<T>? data;

  BaseResponseListModel({required this.data, required this.result, required this.err});

  factory BaseResponseListModel.fromJson(Map<String, dynamic> json,Function(List<dynamic>) decodeFunction) {
    return BaseResponseListModel<T>(data: json['data'] == null || json['data'] == [] ? null : decodeFunction(json['data']), result: json['result'], err: json['err']);
  }

  Map<String, dynamic> toJson() => {
    "data": data,
    "result": result,
    "err": err,
  };

}