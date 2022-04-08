import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String name;

  final Function? function;
  final TextEditingController controller;

  const TextFieldWidget({
    Key? key,
    this.function,
    required this.name,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        onTap: () {},
        onSubmitted: (text) {},
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: name,
        ),
      ),
    );
  }
}
