import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  Widget buildButton(String text, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * buttonHeight,
      color: buttonColor,
      child: MaterialButton(
        onPressed: null,
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: const BorderSide(
              color: Colors.white, width: 1, style: BorderStyle.solid),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nankau calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
            child: const Text(
              '0',
              style: TextStyle(fontSize: 38),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 30, 20, 0),
            child: const Text(
              '0',
              style: TextStyle(fontSize: 48),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton('1', 0.1, Colors.black54),
                        buildButton('2', 0.1, Colors.black54),
                        buildButton('3', 0.1, Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('4', 0.1, Colors.black54),
                        buildButton('5', 0.1, Colors.black54),
                        buildButton('6', 0.1, Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('7', 0.1, Colors.black54),
                        buildButton('8', 0.1, Colors.black54),
                        buildButton('9', 0.1, Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('.', 0.1, Colors.black54),
                        buildButton('0', 0.1, Colors.black54),
                        buildButton('00', 0.1, Colors.black54),
                      ],
                    ),
                    TableRow(children: [
                      buildButton('C', 0.15, Colors.blue),
                      buildButton('⌫', 0.15, Colors.red),
                      buildButton('÷', 0.15, Colors.blue),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton('×', 0.1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton('+', 0.1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton('-', 0.1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton('=', 0.25, Colors.green),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
