import 'package:flutter/material.dart';

class LoadingIndeecator extends StatelessWidget {
  const LoadingIndeecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
