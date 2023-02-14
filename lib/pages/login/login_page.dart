import 'package:entrance_test/commons/components/confirm_checkbox.dart';
import 'package:entrance_test/commons/components/input_textfield.dart';
import 'package:entrance_test/commons/components/social_login_widget.dart';
import 'package:entrance_test/commons/configs/app_color.dart';
import 'package:entrance_test/generated/assets.gen.dart';
import 'package:entrance_test/pages/login/auth_controller.dart';
import 'package:entrance_test/pages/register/register_binding.dart';
import 'package:entrance_test/pages/register/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/base_page.dart';

class LoginPage extends BasePage<AuthController> {
  LoginPage({Key? key}) : super(key: key);

  final _emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final theme = Theme.of(context).textTheme;
    return GetBuilder(
      initState: onInit(context),
      init: controller,
      builder: (_) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            backgroundColor: AppColors.background,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    color: AppColors.scafoldBackground,
                    height: padding.top,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Assets.images.imgBgLogin.svg(
                      fit: BoxFit.cover
                    ),
                  ),
                  Container(
                    color: AppColors.background,
                    padding: EdgeInsets.fromLTRB(16, 80, 16, 20 + padding.bottom),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to Entrance Test Interview!",
                          style: theme.headlineLarge,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Please sign-in to your account and start the adventure",
                          style: theme.bodySmall,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Obx(() => InputField(
                          focusNode: _emailFocusNode,
                          hintText: "johndoe@gmail.com",
                          title: "Email",
                          isRequired: true,
                          errorText: controller.emailErrorText.value,
                          onChanged: controller.onEmailChanged,
                        )),
                        const SizedBox(
                          height: 24,
                        ),
                        Obx(() => InputField(
                          hintText: "⚉ ⚉ ⚉ ⚉ ⚉ ⚉ ⚉ ⚉",
                          title: "Password",
                          isRequired: true,
                          rightButtonText: "Forgot Password?",
                          obscureText: true,
                          onRightButtonTap: () {
                            print("Forgot Password");
                          },
                          errorText: controller.passwordErrorText.value,
                          onChanged: controller.onPasswordChanged,
                        )),
                        const SizedBox(
                          height: 34,
                        ),
                        Obx(() => ConfirmCheckbox(
                            onTap: controller.onRemembermeTap, 
                            title: "Remember me", 
                            isCheck: controller.isRememberMe.value
                          )
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: controller.login, 
                            child: const Text(
                              "Login"
                            )
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'New on our platform?',
                                  style: theme.bodyMedium,
                                ),
                                const WidgetSpan(
                                  alignment: PlaceholderAlignment.baseline,
                                  baseline: TextBaseline.alphabetic,
                                  child: SizedBox(width: 6)
                                ),
                                TextSpan(
                                  text: 'Create an account',
                                  style: theme.bodyMedium?.copyWith(
                                    color: AppColors.primary
                                  ),
                                  recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    Get.to(() => const RegisterPage(),
                                      binding: RegisterBinding(
                                        registerSucess: controller.setLogin
                                      ),
                                      transition: Transition.noTransition
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: SocialLoginWidget(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
        );
      },
    );
  }
}
