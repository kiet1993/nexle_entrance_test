import '../providers/network/apis/authen_api.dart';
import '../providers/network/model/request/register_model.dart';
import '../providers/network/model/response/user_model.dart';

abstract class AuthenRepository {
  Future<UserModel> login(Map<String, String> query);
  Future<UserModel> register(RegisterModel registerModel);
  Future logout();
}

class AuthenRepositoryIml extends AuthenRepository {
  @override
  Future<UserModel> login(Map<String, String> query) async {
    final response = await AuthenAPI.login(loginQuery: query)
        .request()
        .then((value) => UserModel.fromJson(value));
    return response;
  }

  @override
  Future<UserModel> register(RegisterModel registerModel) async {
    final response = await AuthenAPI.register(registerModel: registerModel)
        .request()
        .then((value) => UserModel.fromJson(value));
    return response;
  }

  @override
  Future logout() async {
    var response = await AuthenAPI.logout()
        .request();
    return response;
  }
}
