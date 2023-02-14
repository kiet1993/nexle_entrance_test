import 'package:entrance_test/pages/home/home_page.dart';
import 'package:entrance_test/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../login/auth_controller.dart';

class Root extends GetView<AuthController> {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: controller,
        builder: (_) {
          var isLoggedIn = controller.isLogedIn.value;
          return isLoggedIn ? const HomePage() : LoginPage();
        });
  }
}
