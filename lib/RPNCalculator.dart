class RPNCalculator {
  final List<double> _stack = [];

  void push(double value) {
    _stack.add(value);
  }

  double pop() {
    return _stack.removeLast();
  }

  void add() {
    if (_stack.length < 2) {
      throw Exception('Not enough operands');
    }
    double operand2 = pop();
    double operand1 = pop();
    push(operand1 + operand2);
  }

  void subtract() {
    if (_stack.length < 2) {
      throw Exception('Not enough operands');
    }
    double operand2 = pop();
    double operand1 = pop();
    push(operand1 - operand2);
  }

  void multiply() {
    if (_stack.length < 2) {
      throw Exception('Not enough operands');
    }
    double operand2 = pop();
    double operand1 = pop();
    push(operand1 * operand2);
  }

  void divide() {
    if (_stack.length < 2) {
      throw Exception('Not enough operands');
    }
    double operand2 = pop();
    if (operand2 == 0) {
      throw Exception('Cannot divide by zero');
    }
    double operand1 = pop();
    push(operand1 / operand2);
  }

  double result() {
    if (_stack.isEmpty) {
      throw Exception('No result available');
    }
    return _stack.last;
  }
}