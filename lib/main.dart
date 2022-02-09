// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key})
      : super(key: key); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontsize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontsize = 48.0;
      } else if (buttonText == "X") {
        equationFontSize = 48.0;
        resultFontsize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 38.0;
        resultFontsize = 48.0;

        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('/', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "error";
        }
      } else {
        equationFontSize = 38.0;
        resultFontsize = 48.0;

        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildbutton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: const BorderSide(
                  color: Colors.white, width: 1, style: BorderStyle.solid)),
          padding: const EdgeInsets.all(30.0),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Calculator"))),
      body: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: (Text(
                equation,
                style: TextStyle(fontSize: equationFontSize),
              ))),
          Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: (Text(
                result,
                style: TextStyle(fontSize: resultFontsize),
              ))),
          const Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // ignore: sized_box_for_whitespace
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildbutton("C", 2, Colors.redAccent),
                      buildbutton("X", 2, Colors.blue),
                      buildbutton("/", 2, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildbutton("7", 2, Colors.black54),
                      buildbutton("8", 2, Colors.black54),
                      buildbutton("9", 2, Colors.black54),
                    ]),
                    TableRow(children: [
                      buildbutton("4", 2, Colors.black54),
                      buildbutton("5", 2, Colors.black54),
                      buildbutton("6", 2, Colors.black54),
                    ]),
                    TableRow(children: [
                      buildbutton("1", 2, Colors.black54),
                      buildbutton("2", 2, Colors.black54),
                      buildbutton("3", 2, Colors.black54),
                    ]),
                    TableRow(children: [
                      buildbutton(".", 2, Colors.black54),
                      buildbutton("0", 2, Colors.black54),
                      buildbutton("00", 2, Colors.black54),
                    ]),
                  ],
                ),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildbutton(
                        "x",
                        2,
                        Colors.blue,
                      )
                    ]),
                    TableRow(children: [
                      buildbutton(
                        "-",
                        2,
                        Colors.blue,
                      )
                    ]),
                    TableRow(children: [
                      buildbutton(
                        "+",
                        2,
                        Colors.blue,
                      )
                    ]),
                    TableRow(children: [
                      buildbutton(
                        "=",
                        4,
                        Colors.redAccent,
                      )
                    ])
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
