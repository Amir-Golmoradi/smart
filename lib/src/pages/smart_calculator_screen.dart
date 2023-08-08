import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:smart/src/widgets/calculator_button/smart_claculator_button.dart';

class SmartCalculatorScreen extends StatefulWidget {
  const SmartCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<SmartCalculatorScreen> createState() {
    return _SmartCalculatorScreenState();
  }
}

class _SmartCalculatorScreenState extends State<SmartCalculatorScreen> {
  String _expression = '';
  String _result = '';

  void _updateExpression(String value) {
    setState(() {
      _expression += value;
    });
  }

  void _clearExpression() {
    setState(
      () {
        _expression = '';
        _result = '';
      },
    );
  }

  void _calculateResult() {
    try {
      final expr = _expression.replaceAll('x', '*');
      final parser = Parser();
      final expression = parser.parse(expr);
      final context = ContextModel();
      final result = expression.evaluate(EvaluationType.REAL, context);
      setState(() {
        _result = result.toString();
      });
    } catch (e) {
      setState(() {
        _result = 'Error';
      });
    }
  }

  Widget buildButton(
    String text, {
    VoidCallback? onPressed,
    bool isEqualsButton = false,
    bool isClearButton = false,
  }) {
    return SmartCalculatorButton(
      text: text,
      onPressed: onPressed,
      isEqualsButton: isEqualsButton,
      isClearButton: isClearButton,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(247, 248, 251, 1),
            Color.fromRGBO(247, 248, 251, 1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(211, 220, 241, 1.0),
        appBar: AppBar(
          title: const Text(
            'Smart Calculator',
            style: TextStyle(color: Colors.black45),
          ),
          backgroundColor: const Color.fromRGBO(211, 220, 241, 1.0),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(211, 220, 241, 1.0),
                      Color.fromRGBO(228, 231, 239, 1.0),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _expression,
                      style: const TextStyle(fontSize: 24.0),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _result,
                      style: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 6),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      buildButton('7', onPressed: () => _updateExpression('7')),
                      buildButton('8', onPressed: () => _updateExpression('8')),
                      buildButton('9', onPressed: () => _updateExpression('9')),
                      buildButton('4', onPressed: () => _updateExpression('4')),
                      buildButton('5', onPressed: () => _updateExpression('5')),
                      buildButton('6', onPressed: () => _updateExpression('6')),
                      buildButton('1', onPressed: () => _updateExpression('1')),
                      buildButton('2', onPressed: () => _updateExpression('2')),
                      buildButton('3', onPressed: () => _updateExpression('3')),
                      buildButton('0', onPressed: () => _updateExpression('0')),
                      buildButton('.', onPressed: () => _updateExpression('.')),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildButton('C',
                            onPressed: _clearExpression, isClearButton: true),
                        buildButton('-',
                            onPressed: () => _updateExpression('-')),
                        buildButton('x',
                            onPressed: () => _updateExpression('x')),
                        buildButton('/',
                            onPressed: () => _updateExpression('÷')),
                        buildButton('+',
                            onPressed: () => _updateExpression('+')),
                        buildButton('=',
                            onPressed: _calculateResult, isEqualsButton: true),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
