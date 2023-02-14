import 'package:entrance_test/services/local_storage.dart';
import 'package:get/get.dart';
import '../../repositories/authen_repository.dart';
import 'auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenRepositoryIml());
    Get.put<AuthController>(
      AuthController(
        store: Get.find<LocalStorageService>(),
        repository: Get.find<AuthenRepositoryIml>(),
      ),
      permanent: true
    );
  }
}