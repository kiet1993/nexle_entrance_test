import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'commons/configs/app_route.dart';
import 'commons/configs/theme.dart';
import 'pages/login/auth_binding.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/root',
        initialBinding: AuthBinding(),
        builder: initLoading(),
        getPages: AppRoute.generateGetPages(),
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }

  initLoading() {
    var init = EasyLoading.init();
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.black
      ..animationStyle = EasyLoadingAnimationStyle.opacity
      ..userInteractions = false;
    return init;
  }
}