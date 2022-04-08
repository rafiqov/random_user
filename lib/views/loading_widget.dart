import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;

  const LoadingWidget({Key? key, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(backgroundColor: Colors.redAccent),
          )
        : const SizedBox.shrink();
  }
}
