class BaseResponse<T> {
  //Bashar
  List<T>? list = [];
  T? data;

  BaseResponse({
    this.data,
    this.list,
  });

  //Bashar
  factory BaseResponse.fromJson(
      {var json,
      T Function(Map<String, dynamic>)? fromJsonMapper,
      String? dataKey}) {
    return BaseResponse<T>(
      data: (json != null && dataKey != null && json is! List)
          ? fromJsonMapper != null
              ? fromJsonMapper(json[dataKey])
              : json[dataKey]
          : (json != null && json is! List)
              ? fromJsonMapper!(json)
              : null,
      list: (json != null && dataKey != null && json[dataKey] is List)
          ? (json[dataKey] as List?)
              ?.map((item) => fromJsonMapper!(item))
              .toList()
          : (json != null && json is List)
              ? (json as List?)?.map((item) => fromJsonMapper!(item)).toList()
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    return map;
  }
}

class TStatus {
  TStatus({
    bool? success,
    String? message,
    num? code,
  }) {
    _success = success;
    _message = message;
    _code = code;
  }

  TStatus.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _code = json['code'];
  }

  bool? _success;
  String? _message;
  num? _code;

  TStatus copyWith({
    bool? success,
    String? message,
    num? code,
  }) =>
      TStatus(
        success: success ?? _success,
        message: message ?? _message,
        code: code ?? _code,
      );

  bool? get success => _success;

  String? get message => _message;

  num? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['code'] = _code;
    return map;
  }
}
