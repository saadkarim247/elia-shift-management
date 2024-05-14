import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_expires_in')
  final int refreshExpiresIn;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'token_type')
  final String tokenType;
  @JsonKey(name: 'session_state')
  final String sessionState;
  @JsonKey(name: 'scope')
  final String scope;

  LoginResponseModel({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshExpiresIn,
    required this.refreshToken,
    required this.tokenType,
    required this.sessionState,
    required this.scope,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        accessToken: json['access_token'] as String,
        expiresIn: json['expires_in'] as int,
        refreshExpiresIn: json['refresh_expires_in'] as int,
        refreshToken: json['refresh_token'] as String,
        tokenType: json['token_type'] as String,
        sessionState: json['session_state'] as String,
        scope: json['scope'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'expires_in': expiresIn,
        'access_token': accessToken,
        'refresh_expires_in': refreshExpiresIn,
        'refresh_token': refreshToken,
        'token_type': tokenType,
        'session_state': sessionState,
        'scope': scope,
      };
}
