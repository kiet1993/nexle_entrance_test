import 'package:entrance_test/commons/configs/app_color.dart';
import 'package:entrance_test/generated/assets.gen.dart';
import 'package:entrance_test/pages/home/components/main_app_bar.dart';
import 'package:entrance_test/pages/login/auth_controller.dart';
import 'package:entrance_test/pages/menu/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/base_page.dart';

class HomePage extends BasePage<AuthController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final padding = MediaQuery.of(context).padding;
    return GetBuilder(
      initState: onInit(context),
      init: controller,
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.scafoldBackground,
          appBar: MainAppBar(
            height: 62,
            userName: controller.userName.value,
          ),
          drawer: MenuPage(
            onLogoutTap: controller.logout,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(15, 83, 15, 20),
                child: Text(
                  "Welcome to Demo App",
                  style: theme.displayMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Assets.images.imgBgHome.svg(),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 83, 15, padding.bottom + 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "COPYRIGHT © 2020",
                    style: theme.bodyMedium,
                    textAlign: TextAlign.left,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
