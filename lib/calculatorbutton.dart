import 'package:flutter/material.dart';

class CalculatorButtons extends StatelessWidget {
  final String activeOperator;
  final Function(String) onButtonPressed;

  CalculatorButtons(
      {required this.activeOperator, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildButtonRow(["7", "8", "9", "/"]),
        _buildButtonRow(["4", "5", "6", "*"]),
        _buildButtonRow(["1", "2", "3", "-"]),
        _buildButtonRow(["0", "C", "=", "+"]),
      ],
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Row(
      children: buttons.map((buttonText) {
        return _buildButton(buttonText);
      }).toList(),
    );
  }

  Widget _buildButton(String buttonText) {
    bool isOperator = buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/";
    bool isActive = activeOperator == buttonText;

    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive
              ? Colors.orangeAccent
              : (isOperator ? Colors.blue : Colors.grey[200]),
          padding: EdgeInsets.all(20.0),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            color: isActive
                ? Colors.white
                : (isOperator ? Colors.white : Colors.black),
          ),
        ),
        onPressed: () => onButtonPressed(buttonText),
      ),
    );
  }
}
