// class ErrorMyTasksModel

import 'error_extra.dart';

/// error : "Invalid format for Authentication header"
/// error_code : 412
/// error_extra : {"access_type":"none","event_id":"09df22b7c2c7402090cfd13ed3e9285f","retry_after":3}
/// error_tag : "AUTH_INVALID_AUTHENTICATION_HEADER"
/// http_code : 403

class ErrorAppModel {
    ErrorAppModel({
        this.error,
        this.errorCode,
        this.errorExtra,
        this.errorTag,
        this.httpCode,});

    ErrorAppModel.fromJson(dynamic json) {
        error = json['error'];
        errorCode = json['error_code'];
        errorExtra = json['error_extra'] != null ? ErrorExtra.fromJson(json['error_extra']) : null;
        errorTag = json['error_tag'];
        httpCode = json['http_code'];
    }
    String? error;
    int? errorCode;
    ErrorExtra? errorExtra;
    String? errorTag;
    int? httpCode;
    ErrorAppModel copyWith({  String? error,
        int? errorCode,
        ErrorExtra? errorExtra,
        String? errorTag,
        int? httpCode,
    }) => ErrorAppModel(  error: error ?? this.error,
        errorCode: errorCode ?? this.errorCode,
        errorExtra: errorExtra ?? this.errorExtra,
        errorTag: errorTag ?? this.errorTag,
        httpCode: httpCode ?? this.httpCode,
    );
    Map<String, dynamic> toJson() {
        final map = <String, dynamic>{};
        map['error'] = error;
        map['error_code'] = errorCode;
        if (errorExtra != null) {
            map['error_extra'] = errorExtra?.toJson();
        }
        map['error_tag'] = errorTag;
        map['http_code'] = httpCode;
        return map;
    }

}