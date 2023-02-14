import 'package:entrance_test/pages/home/home_page.dart';
import 'package:entrance_test/pages/register/register_page.dart';
import 'package:get/get.dart';
import '../../pages/login/login_page.dart';
import '../../pages/root/root.dart';

class AppRoute {
  static String routeRootScreen() => '/root';

  static String routeLoginScreen() => '/login';

  static String routeRegisterScreen() => '/register';

  static String routeHomeScreen() => '/home';

  static List<GetPage> generateGetPages() => [
    GetPage(
      name: routeRootScreen(),
      page: () => const Root(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: routeLoginScreen(),
      page: () => LoginPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: routeRegisterScreen(),
      page: () => const RegisterPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: routeHomeScreen(),
      page: () => const HomePage(),
      transition: Transition.cupertino,
    ),
  ];
}
