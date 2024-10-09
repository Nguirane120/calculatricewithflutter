import 'package:calculatrice/calculatorbutton.dart';
import 'package:calculatrice/calculatriceservice.dart';
import 'package:calculatrice/display.dart';
import 'package:flutter/material.dart';

class Calculatrice extends StatefulWidget {
  const Calculatrice({super.key});

  @override
  State<Calculatrice> createState() => _CalculatriceState();
}

class _CalculatriceState extends State<Calculatrice> {
  final Calculatriceservice _calculator = Calculatriceservice();

  void _onButtonPressed(String buttonText) {
    setState(() {
      _calculator.buttonPressed(buttonText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Display(output: _calculator.output),
          Expanded(child: Divider()),
          CalculatorButtons(
            activeOperator: _calculator.activeOperator,
            onButtonPressed: _onButtonPressed,
          ),
        ],
      ),
    );
  }
}
