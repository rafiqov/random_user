import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_user/controllers/home_controller.dart';
import 'package:random_user/views/loading_widget.dart';
import 'package:random_user/views/text_field_widget.dart';
import 'package:random_user/views/utils.dart';

import '../views/user_details.dart';

class HomePage extends StatelessWidget {
  static const String id = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: () async {
            controller.apiGetUsers();
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              toolbarHeight: 60,
              titleTextStyle: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              title: Text(
                  'Hello ' + (Utils.upper(controller.getName()) ?? 'User')),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () => controller.signOut(),
                    icon: const Icon(Icons.logout, color: Colors.grey))
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: ListTile(
                  horizontalTitleGap: 0,
                  title: TextFieldWidget(
                    name: 'Search by nationality',
                    controller: controller.searchController,
                  ),
                  trailing: IconButton(
                    onPressed: () => controller.doSearch(),
                    icon: const Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),
            body: Stack(
              children: [
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.users.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .9,
                      crossAxisCount: 2,
                      mainAxisSpacing: 2),
                  itemBuilder: (context, index) {
                    return DetailUser(
                      function: () =>
                          controller.viewOtherProfile(controller.users[index]),
                      user: controller.users[index],
                    );
                  },
                ),
                LoadingWidget(isLoading: controller.isLoading)
              ],
            ),
          ),
        );
      },
    );
  }
}
