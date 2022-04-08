import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_user/pages/detail_page.dart';

import 'package:random_user/pages/home_page.dart';
import 'package:random_user/pages/sign_in_page.dart';
import 'package:random_user/services/di_service.dart';
import 'package:random_user/services/local_db_service.dart';
import 'package:random_user/services/network_service.dart';
import 'package:random_user/views/view_sign_in.dart';

Network network = Network();

void main() async {
  await DIService.init();
  await GetStorageDB.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random User',
      home: const MainPage(),
      getPages: [
        GetPage(name: MainPage.id, page: () => const MainPage()),
        GetPage(name: HomePage.id, page: () => const HomePage()),
        GetPage(name: DetailPage.id, page: () => const DetailPage()),
        GetPage(name: SignInView.id, page: () => const SignInView()),
      ],
    );
  }
}
