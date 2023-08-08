import'package:flutter/material.dart';
import 'package:smart/src/pages/smart_calculator_screen.dart';

class SmartCalculator extends StatelessWidget {
  const SmartCalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Calculator',

      home:SmartCalculatorScreen(),
    );
  }
}
