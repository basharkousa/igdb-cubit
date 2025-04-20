/// access_token : "11xfnm0uo5jw04jkx18xp3mtv28fe2"
/// expires_in : 4916372
/// token_type : "bearer"

class LoginModel {
  String? _accessToken;
  num? _expiresIn;
  String? _tokenType;

  LoginModel({
    String? accessToken,
    num? expiresIn,
    String? tokenType,
  }) {
    _accessToken = accessToken;
    _expiresIn = expiresIn;
    _tokenType = tokenType;
  }

  LoginModel.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _expiresIn = json['expires_in'];
    _tokenType = json['token_type'];
  }

  LoginModel copyWith({
    String? accessToken,
    num? expiresIn,
    String? tokenType,
  }) =>
      LoginModel(
        accessToken: accessToken ?? _accessToken,
        expiresIn: expiresIn ?? _expiresIn,
        tokenType: tokenType ?? _tokenType,
      );

  String? get accessToken => _accessToken;

  num? get expiresIn => _expiresIn;

  String? get tokenType => _tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['expires_in'] = _expiresIn;
    map['token_type'] = _tokenType;
    return map;
  }
}
