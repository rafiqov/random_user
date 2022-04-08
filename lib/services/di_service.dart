import 'package:get/get.dart';
import 'package:random_user/controllers/detail_controller.dart';

import '../controllers/home_controller.dart';
import '../controllers/sign_in_controller.dart';

class DIService {
  static Future<void> init() async {

    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<DetailController>(() => DetailController(), fenix: true);

  }
}