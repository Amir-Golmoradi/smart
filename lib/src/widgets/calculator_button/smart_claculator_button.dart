import 'package:flutter/material.dart';

class SmartCalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEqualsButton;
  final bool isClearButton;

  const SmartCalculatorButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isEqualsButton = false,
    this.isClearButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.only(bottom: 1),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(157, 213, 252, 1.0),
            Color.fromRGBO(247, 248, 251, 0.19),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      height: 62,
      width: 90,
      child: Material(
        color: isEqualsButton
            ? const Color.fromRGBO(90, 176, 234, 1.0)
            : const Color.fromRGBO(247, 248, 251, 0.19),
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 35.0,
                color: Color.fromRGBO(8, 128, 196, 0.9568627450980393),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
