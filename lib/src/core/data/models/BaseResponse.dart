class BaseResponse<T> {
  //Bashar
  List<T>? list = [];
  T? data;

  BaseResponse({
    this.data,
    this.list,
  });

  //Bashar
/*  factory BaseResponse.fromJson(
      {var json,
      T Function(Map<String, dynamic>)? fromJsonMapper,
      String? dataKey}) {
    return BaseResponse<T>(
      data: (json != null && dataKey != null && json is! List)
          ? fromJsonMapper != null
              ? fromJsonMapper(json[dataKey])
              : json[dataKey]
          : (json != null && json is! List)
              ? json
              : null,
      list: (json != null && dataKey != null && json[dataKey] is List)
          ? (json[dataKey] as List?)
              ?.map((item) => fromJsonMapper!(item))
              .toList()
          : (json != null && json is List)
              ? (json as List?)?.map((item) => fromJsonMapper!(item)).toList()
              : null,
    );
  }*/

  factory BaseResponse.fromJson({
    dynamic json,
    T Function(Map<String, dynamic>)? fromJsonMapper,
    String? dataKey,
  }) {
    if (json == null) return BaseResponse<T>();

    // Case 1: If dataKey is provided and json contains that key
    if (dataKey != null && json is Map && json.containsKey(dataKey)) {
      final dataValue = json[dataKey];

      // Subcase 1.1: The dataValue is a List
      if (dataValue is List) {
        return BaseResponse<T>(
          list: fromJsonMapper != null
              ? dataValue.map((item) => fromJsonMapper(item as Map<String, dynamic>)).toList()
              : null,
        );
      }
      // Subcase 1.2: The dataValue is a single item
      else {
        return BaseResponse<T>(
          data: fromJsonMapper != null && dataValue is Map<String, dynamic>
              ? fromJsonMapper(dataValue)
              : dataValue as T?,
        );
      }
    }
    // Case 2: No dataKey provided, json is a List
    else if (json is List) {
      return BaseResponse<T>(
        list: fromJsonMapper != null
            ? json.map((item) => fromJsonMapper(item as Map<String, dynamic>)).toList()
            : null,
      );
    }
    // Case 3: No dataKey provided, json is a Map (direct data)
    else if (json is Map<String, dynamic>) {
      return BaseResponse<T>(
        data: fromJsonMapper != null
            ? fromJsonMapper(json)
            : json as T?,
      );
    }
    // Case 4: Unexpected format
    else {
      return BaseResponse<T>();
    }
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
