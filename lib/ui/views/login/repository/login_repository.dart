import 'package:elia_app/base_repository/base_repository.dart';
import 'package:elia_app/base_repository/result.dart';
import 'package:elia_app/common/models/user_model.dart';
import 'package:elia_app/services/network_info_service.dart';
import 'package:elia_app/ui/views/login/datasources/login_datasource_api.dart';
import 'package:elia_app/ui/views/login/models/login_response_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

class LoginRepository extends BaseRepository with ListenableServiceMixin {
  late final LoginApiDatasource _apiDatasource;

  late final NetworkInfoServiceImpl _networkInfoService;

  LoginRepository({
    @factoryParam LoginApiDatasource? remote,
  }) {
    _apiDatasource = remote ?? LoginApiDatasource(dio, baseUrl: endpoint);
  }

  Future<UserModel> _getLoginResponse(
    String email,
    Map<String, String> request,
  ) async {
    if (!(await _networkInfoService.isConnected)) {
      throw Exception('No internet Connection');
    }
    try {
      final Result<LoginResponseModel> loginResponse = await safeCall(
        _apiDatasource.getLoginResponse(request),
        entityMapper: null,
      );
      final result = loginResponse.when<UserModel>(
        onSuccess: (data) {
          // TODO(saad): Check mapping again
          final user = UserModel(
            id: data.accessToken,
            email: email,
            name: 'name',
            token: data.accessToken.toString(),
            loginResponseModel: data,
          );
          return user;
        },
        onError: (error, code) {
          throw Exception(error);
        },
      );

      return result;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<UserModel> getLoginResponse({
    required String email,
    required String password,
  }) async {
    final Map<String, String> loginRequest = {
      'email': email,
      'password': password,
    };
    return _getLoginResponse(email, loginRequest);
  }
}
