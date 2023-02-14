import 'package:get/get.dart';
import '../pages/login/auth_controller.dart';
import 'configs/app_route.dart';
import 'exceptions/app_exception.dart';

class BaseController extends GetxController {
  Function(String)? onError;
  Function(String)? onSuccess;
  Function(bool)? onLoading;
  Function? onTokenExpired;
  Function(String)? showDialogSuccess;

  int _loadingCount = 0;

  showLoading(bool isShow) {
    if (isShow) {
      if(_loadingCount == 0) {
        onLoading!(true);
      }
      _loadingCount += 1;
    } else {
      _loadingCount -= 1;
      if(_loadingCount == 0) {
        onLoading!(false);
      }
    }
  }

  void handleError(Object error) {
    if (error is AppException) {
      onError?.call(error.message);
    } else {
      onError?.call(error.toString());
    }
  }

  handleLogout() {
    final authController = Get.find<AuthController>();
    authController.logout();
    Get.offAllNamed(AppRoute.routeRootScreen());
  }

  back() {
    Get.back();
  }
}