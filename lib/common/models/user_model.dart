import 'package:elia_app/ui/views/login/models/login_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
abstract class UserModel {
  factory UserModel({
    required String id,
    required String email,
    required String name,
    required String token,
    required LoginResponseModel loginResponseModel,
  }) = _UserModel;
  // User._();

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String,
        email: json['email'] as String,
        token: json['token'] as String,
        name: json["name"] as String,
        loginResponseModel: LoginResponseModel.fromJson(
            json['loginResponseModel'] as Map<String, dynamic>),
      );
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {required final String id,
      required final String email,
      required final String name,
      required final String token,
      required final LoginResponseModel loginResponseModel}) = _$UserModelImpl;

  String get id;
  String get email;
  String get name;
  String get token;

  LoginResponseModel get loginResponseModel;
}

class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {required this.id,
      required this.email,
      required this.name,
      required this.token,
      required this.loginResponseModel});

  @override
  final String id;

  @override
  final String email;

  @override
  final String name;

  @override
  final String token;

  @override
  final LoginResponseModel loginResponseModel;

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email,name: $name, token: $token, loginResponseModel: $loginResponseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email));
  }
}
