import 'package:bmi_calculatorr/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData? iconData;
  final String? label;

  // Use the named parameters for the constructor
  const IconContent({super.key, this.iconData, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label!,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
