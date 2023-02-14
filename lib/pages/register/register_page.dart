import 'package:entrance_test/commons/components/confirm_checkbox.dart';
import 'package:entrance_test/commons/components/input_textfield.dart';
import 'package:entrance_test/commons/components/social_login_widget.dart';
import 'package:entrance_test/commons/configs/app_color.dart';
import 'package:entrance_test/generated/assets.gen.dart';
import 'package:entrance_test/pages/register/register_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../commons/base_page.dart';

class RegisterPage extends BasePage<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

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
                    child: Assets.images.imgBgRegister.svg(
                      fit: BoxFit.cover
                    ),
                  ),
                  Container(
                    color: AppColors.background,
                    padding: EdgeInsets.fromLTRB(16, 20, 16, 20 + padding.bottom),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Adventure starts here",
                          style: theme.headlineLarge,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Make your app management easy and fun!",
                          style: theme.bodySmall,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Obx(() => InputField(
                          hintText: "johndoe",
                          title: "First name",
                          isRequired: true,
                          errorText: controller.firstnameErrorText.value,
                          onChanged: controller.onFirstnameChanged,
                        )),
                        Obx(() => InputField(
                          hintText: "johndoe",
                          title: "Last name",
                          isRequired: true,
                          errorText: controller.lastnameErrorText.value,
                          onChanged: controller.onLastnameChanged,
                        )),
                        Obx(() => InputField(
                          hintText: "johndoe@gmail.com",
                          title: "Email",
                          isRequired: true,
                          errorText: controller.emailErrorText.value,
                          onChanged: controller.onEmailChanged,
                        )),
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
                          height: 8,
                        ),
                        Obx(() => ConfirmCheckbox(
                            onTap: controller.onAgreedTap, 
                            title: "i agree to", 
                            isCheck: controller.isAgreed.value,
                            hyperText: 'privacy policy & terms',
                            onHyperTextTap: () {
                              print("navigate to privacy policy & terms page");
                            },
                          )
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: controller.register, 
                            child: const Text(
                              "Sign Up"
                            )
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account?',
                                  style: theme.bodyMedium,
                                ),
                                const WidgetSpan(
                                  alignment: PlaceholderAlignment.baseline,
                                  baseline: TextBaseline.alphabetic,
                                  child: SizedBox(width: 6)
                                ),
                                TextSpan(
                                  text: 'Sign in instead',
                                  style: theme.bodyMedium?.copyWith(
                                    color: AppColors.primary
                                  ),
                                  recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    controller.back();
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
