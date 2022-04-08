import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_user/controllers/sign_in_controller.dart';
import 'package:random_user/pages/home_page.dart';
import 'package:random_user/views/view_sign_in.dart';

class MainPage extends StatelessWidget {
  static const String id = '/main';

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return GetBuilder<SignInController>(
      init: SignInController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: controller.isSigned
                ? const HomePage()
                : SignInView(controller: controller),
          ),
        );
      },
    );
  }
}
