import 'package:advisor_graduation_project/components/customElevatedButton.dart';
import 'package:advisor_graduation_project/components/customTextField.dart';
import 'package:advisor_graduation_project/constants.dart';
import 'package:advisor_graduation_project/modules/login/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends GetView<LoginController> {

  final GlobalKey<FormState> loginFormKey;

  const LoginForm({
    required this.loginFormKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: loginFormKey,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              child: CustomTextField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction : TextInputAction.next,
                onSaved: (value) {
                  controller.email = value!;
                },
                validator: (value) {
                  return controller.validateEmail(value!);
                },
                decoration: InputDecoration(
                  hintText: 'email'.tr,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              child: Obx((){
                return CustomTextField(
                  controller: controller.passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.isPassword.value,
                  onSaved: (value) {
                    controller.password = value!;
                  },
                  // validator: (value) {
                  //   return controller.validatePassword(value!);
                  // },
                  decoration: InputDecoration(
                    hintText: 'password'.tr,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: primaryBlackColor,
                      ),
                      onPressed: () {
                        controller.changePassword();
                      },
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
    );
  }
}
