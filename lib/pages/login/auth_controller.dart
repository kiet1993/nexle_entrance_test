import 'package:get/get.dart';
import '../../commons/base_controller.dart';
import '../../repositories/authen_repository.dart';
import '../../services/local_storage.dart';

class AuthController extends BaseController {
  final LocalStorageService store;
  final AuthenRepository repository;

  AuthController({
    required this.repository,
    required this.store
  });

  var isLogedIn = false.obs;

  var email = "";
  var password = "";
  final isRememberMe = false.obs;
  final emailErrorText = Rx<String?>(null);
  final passwordErrorText = Rx<String?>(null);

  final userName = "".obs;

  @override
  void onInit() {
    initController();
    super.onInit();
  }

  initController() {
    isLogedIn.value = store.token != null && store.isAutoLogin;
    userName.value = store.username ?? "";
  }

  setLogin() {
    isLogedIn.value = true;
    userName.value = store.username ?? "";
  }

  onEmailChanged(String text) {
    email = text.trim();
    emailErrorText.value = null;
  }

  onPasswordChanged(String text) {
    password = text.trim();
    passwordErrorText.value = null;
  }

  onRemembermeTap() {
    isRememberMe.value = !isRememberMe.value;
  }

  bool isFormValidated(){
    var isValid = true;
    if(email.isEmpty) {
      emailErrorText.value = "The email is required";
      isValid = false;
    } else if(!email.isEmail) {
      emailErrorText.value = "The email is not valid";
      isValid = false;
    }
    if (password.isEmpty) {
      passwordErrorText.value = "The password is required";
      isValid = false;
    }
    return isValid;
  }

  login() async {
    if (!isFormValidated()) {
      return;
    }
    onLoading?.call(true);
    try {
      final query = {"email": email, "password": password};
      final result = await repository.login(query);
      onLoading?.call(false);
      store.token = result.token;
      store.isAutoLogin = isRememberMe.value;
      store.username = result.displayName;
      isLogedIn.value = true;
      userName.value = result.displayName;
      email = "";
      password = "";
      isRememberMe.value = false;
    } on Exception catch (err) {
      onLoading?.call(false);
      handleError(err);
    }
  }

  logout() async {
    onLoading?.call(true);
    try {
      await repository.logout();
      onLoading?.call(false);
      isLogedIn.value = false;
      store.token = null;
      store.isAutoLogin = null;
      store.username = null;
    } on Exception catch (err) {
      onLoading?.call(false);
      handleError(err);
    }
  }
}
