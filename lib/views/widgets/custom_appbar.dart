
import 'package:flutter/material.dart';
import 'package:flutter_engr/views/widgets/button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomBackButton(),
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 40)
      ],
    );
  }
}

