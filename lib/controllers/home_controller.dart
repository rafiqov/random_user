import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:random_user/main.dart';
import 'package:random_user/models/user_model.dart';
import 'package:random_user/pages/detail_page.dart';
import 'package:random_user/pages/sign_in_page.dart';
import 'package:random_user/services/local_db_service.dart';
import 'package:random_user/views/view_sign_in.dart';

class HomeController extends GetxController {
  bool isLoading = false;
  bool isSearch = false;
  List<User> users = [];
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    apiGetUsers();
    super.onInit();
  }

  String? getName()  {
    String? user =  GetStorageDB.load(StorageKeys.uid);
    Get.log(user.toString());
    return user.toString();
  }

  void apiGetUsers() async {
    isLoading = true;
    var res = await network.GET(network.apiList, network.paramsEmpty());
    if (res.isNotEmpty) {
      isLoading = false;
      users = network.parseUserList(res);
      update();
    }
  }

  void signOut() {
    GetStorageDB.remove(StorageKeys.uid);
    Get.off(() => const MainPage());
  }

  void viewOtherProfile(User user) {
    Get.toNamed(DetailPage.id, arguments: user);
  }

  void doSearch() async {

    String search = searchController.text.trim().toString();
    if (search.length==2) {
      var res =
          await network.GET(network.apiList, network.paramsSearch(search));
      if (res.isNotEmpty) {
        isLoading = false;
        isSearch = false;
        users = network.parseUserList(res);
        searchController.clear();
        update();
      }
    } else {
      Get.snackbar('Something wrong', 'Please enter nationality');
    }
  }
}
