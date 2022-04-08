import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function() function;
  final String text;

  const MainButton({
    required this.function,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Colors.blueAccent.shade700,
                Colors.blueAccent.shade100
              ])),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: MaterialButton(
        shape: const StadiumBorder(),
        height: 50,
        onPressed: () => function(),
        child: Text(text),
        textColor: Colors.black,
      ),
    );
  }
}
