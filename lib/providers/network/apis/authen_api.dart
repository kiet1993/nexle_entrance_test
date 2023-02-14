import 'dart:io';

import 'package:get/get.dart';

import '../../../services/local_storage.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';
import '../model/request/register_model.dart';

enum AuthenAPIType { 
  login, 
  register,
  logout
}

class AuthenAPI implements APIRequestRepresentable {
  final AuthenAPIType type;
  final store = Get.find<LocalStorageService>();

  final Map<String, String>? loginQuery;
  final RegisterModel? registerModel;

  AuthenAPI._({required this.type, this.loginQuery, this.registerModel});

  AuthenAPI.login({required Map<String, String> loginQuery})
    : this._(type: AuthenAPIType.login, loginQuery: loginQuery);

  AuthenAPI.register({required RegisterModel registerModel})
    : this._(type: AuthenAPIType.register, registerModel: registerModel);
  
  AuthenAPI.logout()
    : this._(type: AuthenAPIType.logout);

  @override
  String get endpoint {
    return "http://streaming.nexlesoft.com:4000/api/auth/";
  }

  @override
  String get path {
    switch (type) {
      case AuthenAPIType.login:
        return "signin";
      case AuthenAPIType.register:
        return "signup";
      case AuthenAPIType.logout:
        return "logout";
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case AuthenAPIType.login:
      case AuthenAPIType.register:
      case AuthenAPIType.logout:
      return HTTPMethod.post;
    }
  }

  @override
  Map<String, String> get headers {
    switch (type) {
      case AuthenAPIType.login:
      case AuthenAPIType.register:
        return {};
      case AuthenAPIType.logout:
        return {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: store.token ?? ""
        };
    }
  }

  @override
  Map<String, String> get query {
    return {};
  }

  @override
  get body {
    switch (type) {
      case AuthenAPIType.login:
        return loginQuery;
      case AuthenAPIType.register:
        if (registerModel != null) {
          return registerModel?.toJson();
        } else {
          return {};
        }
      case AuthenAPIType.logout:
        return {};
    }
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
