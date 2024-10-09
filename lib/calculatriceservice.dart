class Calculatriceservice {
  String _output = "0";
  String _input = "";
  String _operator = "";
  double _num1 = 0;
  double _num2 = 0;
  String _activeOperator = '';

  String get output => _output;
  String get activeOperator => _activeOperator;

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _reset();
    } else if (_isOperator(buttonText)) {
      _num1 = double.parse(_input);
      _operator = buttonText;
      _input = "";
      _activeOperator = buttonText;
    } else if (buttonText == "=") {
      _num2 = double.parse(_input);
      _calculate();
      _activeOperator = "";
    } else {
      _input = _input + buttonText;
      _output = _input;
    }
  }

  bool _isOperator(String buttonText) {
    return buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/";
  }

  void _calculate() {
    switch (_operator) {
      case "+":
        _output = (_num1 + _num2).toString();
        break;
      case "-":
        _output = (_num1 - _num2).toString();
        break;
      case "*":
        _output = (_num1 * _num2).toString();
        break;
      case "/":
        _output = (_num1 / _num2).toString();
        break;
    }
    _input = _output;
  }

  void _reset() {
    _output = "0";
    _input = "";
    _operator = "";
    _num1 = 0;
    _num2 = 0;
    _activeOperator = "";
  }
}
