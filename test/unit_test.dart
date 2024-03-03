import 'package:flutter_test/flutter_test.dart';
import 'package:rpn_calculator/rpn_calculator.dart';

void main() {
  test('Test RPNCalculator operations', () {
    final calculator = RPNCalculator();

    calculator.inputNumber('5');
    calculator.enter();
    calculator.inputNumber('3');
    calculator.enter();
    calculator.performOperation('+');
    expect(calculator.stack.last, 8.0);

    calculator.inputNumber('2');
    calculator.enter();
    calculator.performOperation('*');
    expect(calculator.stack.last, 16.0);

    calculator.inputNumber('4');
    calculator.enter();
    calculator.performOperation('/');
    expect(calculator.stack.last, 4.0);

    calculator.inputNumber('2');
    calculator.enter();
    calculator.performOperation('-');
    expect(calculator.stack.last, 2.0);
  });
}