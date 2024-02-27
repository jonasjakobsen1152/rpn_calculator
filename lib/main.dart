import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.orange,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
              minimumSize: MaterialStateProperty.all(const Size(100, 100)),
            ),
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Awesome Calculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.all(200),
            child: buildColumn(),
          ),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              buildExpandedButton('1', () {}),
              buildExpandedButton('2', () {}),
              buildExpandedButton('3', () {}),
              buildExpandedButton('+', () {}),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              buildExpandedButton('4', () {}),
              buildExpandedButton('5', () {}),
              buildExpandedButton('6', () {}),
              buildExpandedButton('-', () {}),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              buildExpandedButton('7', () {}),
              buildExpandedButton('8', () {}),
              buildExpandedButton('9', () {}),
              buildExpandedButton('*', () {}),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              buildExpandedButton('C', () {}),
              buildExpandedButton('0', () {}),
              buildExpandedButton('=', () {}),
              buildExpandedButton('/', () {}),
            ],
          ),
        ),
      ],
    );
  }

  Expanded buildExpandedButton(String label, VoidCallback onPressed) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
