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
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Awesome Calculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.center,
            child: buildColumn(),
          ),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          '${calculator.stackToString()}',
          style: TextStyle(fontSize: 24),
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
              buildExpandedButton('='),
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
            if (label == '+') {
              calculator.add();
            } else if (label == '-') {
              calculator.subtract();
            } else if (label == '*') {
              calculator.multiply();
            } else if (label == '/') {
              calculator.divide();
            } else if (label == 'C') {
              calculator.clear();
            } else if (label == '=') {
              // Do nothing for now
            } else {
              calculator.push(double.parse(label));
            }
          });
        },
        child: Text(label),
      ),
    );
  }
}
