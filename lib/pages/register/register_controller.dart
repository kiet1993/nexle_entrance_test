import 'package:entrance_test/commons/base_controller.dart';
import 'package:entrance_test/commons/extensions/string_extensions.dart';
import 'package:entrance_test/providers/network/model/request/register_model.dart';
import 'package:entrance_test/repositories/authen_repository.dart';
import 'package:entrance_test/services/local_storage.dart';
import 'package:get/get.dart';

class RegisterController extends BaseController {
  final AuthenRepository repository;
  final LocalStorageService store;
  final void Function() registerSucess;

  RegisterController({
    required this.repository,
    required this.store,
    required this.registerSucess
  });

  var firstName = "";
  var lastName = "";
  var email = "";
  var password = "";
  
  final firstnameErrorText = Rx<String?>(null);
  final lastnameErrorText = Rx<String?>(null);
  final emailErrorText = Rx<String?>(null);
  final passwordErrorText = Rx<String?>(null);
  final isAgreed = false.obs;

  onFirstnameChanged(String text) {
    firstName = text.trim();
    firstnameErrorText.value = null;
  }

  onLastnameChanged(String text) {
    lastName = text.trim();
    lastnameErrorText.value = null;
  }

  onEmailChanged(String text) {
    email = text.trim();
    emailErrorText.value = null;
  }

  onPasswordChanged(String text) {
    password = text.trim();
    passwordErrorText.value = null;
  }

  onAgreedTap() {
    isAgreed.value = !isAgreed.value;
  }

  bool isFormValidated(){
    var isValid = true;
    if (firstName.isEmpty) {
      firstnameErrorText.value = "The first name is required";
      isValid = false;
    }
    if (lastName.isEmpty) {
      lastnameErrorText.value = "The last name is required";
      isValid = false;
    }
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
    } else if(password.length < 6 || password.length > 18) {
      passwordErrorText.value = "The password must be betwwen 6-18 characters";
      isValid = false;
    } else if(!password.toLowerCase().isValidPassword) {
      passwordErrorText.value = "The password must contain at least one digit, one special character, and one letter";
      isValid = false;
    }
    return isValid && isAgreed.value;
  }

  register() async {
    if (!isFormValidated()) {
      return;
    }
    onLoading?.call(true);
    try {
      final result = await repository.register(
        RegisterModel(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password
        )
      );
      onLoading?.call(false);
      store.token = result.token;
      store.username = result.displayName;
      back();
      registerSucess.call();
    } on Exception catch (err) {
      onLoading?.call(false);
      handleError(err);
    }
  }
}