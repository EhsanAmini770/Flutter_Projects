import 'package:bmi_calculatorr/constants.dart';
import 'package:flutter/material.dart';



class ReusableCard extends StatelessWidget {
  final Color? color;
  final Widget? child;
  // void Function()?
  final VoidCallback? onPress;
  const ReusableCard({super.key, this.color, this.child, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: color ?? kActiveCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
