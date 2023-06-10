import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
  String equation = '0';
  String result = '0';
  String expression = '';
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
  Widget buildButton(String text, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * buttonHeight,
      color: buttonColor,
      child: MaterialButton(
        onPressed: () => buttonPressed(text),
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
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/one_piece.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Color.fromARGB(133, 255, 255, 255),
          appBar: AppBar(
            title: const Text("One piece calculator"),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/one_piece.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
                child: Text(
                  result,
                  style: const TextStyle(fontSize: 38),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.fromLTRB(10, 30, 20, 0),
                child: Text(
                  equation,
                  style: const TextStyle(fontSize: 48),
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
                          buildButton(
                              'C', 0.15, Color.fromARGB(230, 65, 170, 255)),
                          buildButton(
                              '⌫', 0.15, const Color.fromRGBO(244, 67, 54, 40)),
                          buildButton(
                              '÷', 0.15, Color.fromARGB(230, 65, 170, 255)),
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Table(
                      children: [
                        TableRow(children: [
                          buildButton(
                              '×', 0.1, Color.fromARGB(230, 65, 170, 255)),
                        ]),
                        TableRow(children: [
                          buildButton(
                              '+', 0.1, Color.fromARGB(230, 65, 170, 255)),
                        ]),
                        TableRow(children: [
                          buildButton(
                              '-', 0.1, Color.fromARGB(230, 65, 170, 255)),
                        ]),
                        TableRow(children: [
                          buildButton(
                              '=', 0.25, Color.fromRGBO(76, 175, 80, 30)),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  buttonPressed(String text) {
    if (text == 'C') {
      setState(() {
        equation = '0';
        result = '';
        expression = '';
      });
    }
    if (text == '⌫') {
      setState(() {
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
      });
    }
    if (text == '=') {
      setState(() {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'Error';
        }
      });
    }

    if (text == '÷') {
      if (equation == '0') {
        setState(() {
          equation = text;
        });
      } else {
        setState(() {
          equation += text;
        });
      }
    }
    if (text == '×') {
      if (equation == '0') {
        setState(() {
          equation = text;
        });
      } else {
        setState(() {
          equation += text;
        });
      }
    }

    if (text == '+') {
      if (equation == '0') {
        setState(() {
          equation = text;
        });
      } else {
        setState(() {
          equation += text;
        });
      }
    }
    if (text == '-') {
      if (equation == '0') {
        setState(() {
          equation = text;
        });
      } else {
        setState(() {
          equation += text;
        });
      }
    }

    if (text == '.') {
      if (equation == '0') {
        setState(() {
          equation = text;
        });
      } else {
        setState(() {
          equation += text;
        });
      }
    }
    if (text == '00' ||
        text == '0' ||
        text == '1' ||
        text == '2' ||
        text == '3' ||
        text == '4' ||
        text == '5' ||
        text == '6' ||
        text == '7' ||
        text == '8' ||
        text == '9') {
      if (equation == '0') {
        setState(() {
          equation = text;
        });
      } else {
        setState(() {
          equation += text;
        });
      }
    }
  }
}
