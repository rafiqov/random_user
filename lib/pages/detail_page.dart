import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_user/controllers/detail_controller.dart';
import 'package:random_user/views/detail_container.dart';
import 'package:random_user/views/user_details.dart';
import 'package:random_user/views/utils.dart';

class DetailPage extends StatelessWidget {
  static const String id = '/detail_page';

  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (controller) {
        double width = Get.height * controller.width;
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white.withAlpha(200),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              children: [
                //user name
                DetailContainer(
                  height: 60,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => controller.goBack(),
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            (controller.user?.name?.first ?? "No name") +
                                ' ' +
                                (controller.user?.name?.last ?? ""),
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //user image
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Hero(
                      child: InteractiveViewer(
                        child: viewImage(
                            width, controller.user?.picture?.large ?? ''),
                      ),
                      tag: controller.user?.id ?? '154',
                    )),

                //personal details
                DetailContainer(
                  child: Column(
                    children: [
                      description('User Details'),
                      userItem(
                          iconData: Icons.person,
                          name: "Full Name",
                          description:
                              (controller.user?.name?.first ?? "User") +
                                  ' ' +
                                  (controller.user?.name?.last ?? "")),
                      userItem(
                          color: Colors.orange,
                          iconData: Icons.alternate_email,
                          name: "Email",
                          description:
                              controller.user?.email ?? "user@gmail.com"),
                      userItem(
                          color: Colors.green,
                          iconData: Icons.data_usage_outlined,
                          name: "Age",
                          description:
                              controller.user?.dob?.age.toString() ?? "33"),
                      userItem(
                          color: Colors.red,
                          iconData: CupertinoIcons.circle,
                          name: "Gender",
                          description:
                              Utils.upper(controller.user?.gender) ?? "Male"),
                      userItem(
                          color: Colors.indigo,
                          iconData: Icons.phone,
                          name: "Phone",
                          description: controller.user?.phone ?? "+1234567890"),
                      userItem(
                          iconData: Icons.face_retouching_natural,
                          name: "Nationality",
                          description: controller.user?.nat ?? "US"),
                    ],
                  ),
                ),

                //user location
                DetailContainer(
                  child: Column(
                    children: [
                      description('Location'),
                      userItem(
                          color: Colors.red,
                          iconData: CupertinoIcons.location,
                          name: "Country",
                          description:
                              controller.user?.location?.country ?? "US"),
                      userItem(
                          color: Colors.blue,
                          iconData: Icons.location_city,
                          name: "City",
                          description:
                              controller.user?.location?.city ?? "New York"),
                      userItem(
                          color: Colors.deepOrange,
                          iconData: Icons.email,
                          name: "PostCode",
                          description:
                              controller.user?.location?.postcode.toString() ??
                                  "New York"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
