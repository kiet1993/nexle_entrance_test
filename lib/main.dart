import 'package:entrance_test/repositories/authen_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'services/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  await initServices();
  runApp(const App());
}

initServices() async {
  Get.lazyPut(() => AuthenRepositoryIml());
  await Get.putAsync(() => LocalStorageService().init());
}
