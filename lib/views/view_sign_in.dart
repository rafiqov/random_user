import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_user/controllers/sign_in_controller.dart';
import 'package:random_user/views/main_button.dart';
import 'package:random_user/views/text_field_widget.dart';

class SignInView extends StatelessWidget {
  static const String id = '/sign_in';
  final SignInController? controller;

  const SignInView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black.withOpacity(0.7),
            Colors.black.withOpacity(0.3)
          ])),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFieldWidget(name: "Name", controller: controller!.controller),
            MainButton(function: () => controller!.doSignIn(), text: 'Sign In'),
            const SizedBox(height: 50),
          ],
        ),
      ],
    );
  }
}
