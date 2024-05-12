import 'package:bmi_calculatorr/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String? title;
  final VoidCallback onTap;

  const BottomButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      //Navigator.pushNamed(context, '/resultPage');

      child: Container(
        margin: const EdgeInsets.only(top: 10),
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            title!,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
