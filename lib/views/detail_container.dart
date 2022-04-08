import 'package:flutter/material.dart';

class DetailContainer extends StatelessWidget {
  final Widget child;
  final double? height;

  const DetailContainer({Key? key, required this.child, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20)),
        child: child);
  }
}
