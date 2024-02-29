import 'package:flutter/material.dart';
import 'package:rpn_calculator/RPNCalculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RPNCalculator calculator = RPNCalculator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
            minimumSize: MaterialStateProperty.all(const Size(150, 150)),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Awesome Calculator'),
        ),
        body: Align(
          alignment: Alignment.center,
          child: buildColumn(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          calculator.stackToString(),
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text(
          calculator.getCurrentInput(),
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              buildExpandedButton('1'),
              buildExpandedButton('2'),
              buildExpandedButton('3'),
              buildExpandedButton('+'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              buildExpandedButton('4'),
              buildExpandedButton('5'),
              buildExpandedButton('6'),
              buildExpandedButton('-'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              buildExpandedButton('7'),
              buildExpandedButton('8'),
              buildExpandedButton('9'),
              buildExpandedButton('*'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              buildExpandedButton('C'),
              buildExpandedButton('0'),
              buildExpandedButton('enter'),
              buildExpandedButton('/'),
            ],
          ),
        ),
      ],
    );
  }

  Expanded buildExpandedButton(String label) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (label == 'C') {
              calculator.clear();
            } else if (label == 'enter') {
              calculator.enter();
            } else if ('+-*/'.contains(label)) {
              calculator.performOperation(label);
            } else {
              calculator.inputNumber(label);
            }
          });
        },
        child: Text(
          label,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
