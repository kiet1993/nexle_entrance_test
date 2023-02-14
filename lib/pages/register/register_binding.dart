import 'package:entrance_test/pages/register/register_controller.dart';
import 'package:entrance_test/services/local_storage.dart';
import 'package:get/get.dart';
import '../../repositories/authen_repository.dart';

class RegisterBinding extends Bindings {
  final void Function() registerSucess;
  RegisterBinding({
    required this.registerSucess
  });

  @override
  void dependencies() {
    Get.lazyPut(() => AuthenRepositoryIml());
    Get.put<RegisterController>(
      RegisterController(
        store: Get.find<LocalStorageService>(),
        repository: Get.find<AuthenRepositoryIml>(),
        registerSucess: registerSucess
      ),
      permanent: false
    );
  }
}