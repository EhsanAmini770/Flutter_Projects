import 'package:bmi_calculatorr/screens/input_page.dart';
import 'package:bmi_calculatorr/screens/result_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color(0xff0A0D22),
        ),
        scaffoldBackgroundColor: const Color(0xff0A0D22),
      ),
      home: const InputPage(),
      //initialRoute: '/',
      //routes: {
      //'/': (context) => const InputPage(),
      //'/resultPage': (context) => const ResultPage(),
      //},
    );
  }

  const BMICalculator({super.key});
}
