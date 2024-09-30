import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage(
      {super.key, required this.image, required this.description});
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        Text(description),
      ],
    );
  }
}
