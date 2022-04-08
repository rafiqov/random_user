import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:random_user/pages/home_page.dart';
import 'package:random_user/services/local_db_service.dart';

class SignInController extends GetxController {
  bool isSigned = false;
  TextEditingController controller = TextEditingController();

  @override
  void onInit() {
    checkSigned();
    super.onInit();
  }

  void checkSigned()  {
    var res =  GetStorageDB.load(StorageKeys.uid);
    if (res != null) {
      isSigned = true;
      update();
    }
  }

  void doSignIn() {
    String uid = controller.text.trim().toString();
    if (uid.isNotEmpty) {

      GetStorageDB.store(StorageKeys.uid, uid);
      Get.off(() => const HomePage());
    }else{
      Get.snackbar('Something wrong', 'Please enter name');
    }
  }
}
