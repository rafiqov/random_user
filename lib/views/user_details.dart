import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class DetailUser extends StatelessWidget {
  final Function()? function;
  final User? user;
  final double width;

  const DetailUser({this.user, Key? key, this.width = 0.2, this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function?.call(),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(

              tag: user?.id ?? '154',
              child: viewImage(width * Get.height, user?.picture?.large ?? ''),
            ),
            description((user?.name?.title ?? "Dear") +
                ' ' +
                (user?.name?.first ?? "User")),
            description(user?.location?.city ?? "New York", isNormal: true),
          ],
        ),
      ),
    );
  }
}

Widget userItem(
    {IconData? iconData,
    required String name,
    required String description,
    Color? color}) {
  return ListTile(
    horizontalTitleGap: 0,
    leading: Icon(iconData, color: color),
    title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
    trailing: Text(description),
  );
}

Widget description(String text, {bool isNormal = false}) {
  return Text(text,
      style: TextStyle(
          fontWeight: isNormal ? FontWeight.normal : FontWeight.bold,
          fontSize: isNormal ? 14 : 20));
}

CachedNetworkImage viewImage(double width, String url) {
  return CachedNetworkImage(
    height: width,
    width: width,
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width / 4),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
    ),
    placeholder: (context, url) =>
        const Center(child: CircularProgressIndicator()),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
