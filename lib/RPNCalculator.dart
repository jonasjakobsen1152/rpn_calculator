import 'dart:collection';

class RPNCalculator {
  final List<double> _stack = [];
  String _currentInput = '';

  UnmodifiableListView<double> get stack => UnmodifiableListView(_stack);

  void push(double value) {
    _stack.add(value);
  }

  void performOperation(String operation) {
    if (_stack.length < 2) return; // Insufficient operands for binary operation
    final operand2 = _stack.removeLast();
    final operand1 = _stack.removeLast();
    double result;
    switch (operation) {
      case '+':
        result = operand1 + operand2;
        break;
      case '-':
        result = operand1 - operand2;
        break;
      case '*':
        result = operand1 * operand2;
        break;
      case '/':
        result = operand1 / operand2;
        break;
      default:
        return; // Invalid operation
    }
    _stack.add(result);
  }

  void clear() {
    _stack.clear();
    _currentInput = '';
  }

  void inputNumber(String number) {
    _currentInput += number;
  }

  void enter() {
    if (_currentInput.isNotEmpty) {
      _stack.add(double.parse(_currentInput));
      _currentInput = '';
    }
  }

  String stackToString() {
    return _stack.map((value) => value.toString()).join(' ');
  }

  String getCurrentInput() {
    return _currentInput;
  }
}
