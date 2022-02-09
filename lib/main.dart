// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

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
          onPressed: null,
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
              child: (const Text(
                "0",
                style: TextStyle(fontSize: 38.0),
              ))),
          Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: (const Text(
                "0",
                style: TextStyle(fontSize: 48.0),
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

              Container(
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
